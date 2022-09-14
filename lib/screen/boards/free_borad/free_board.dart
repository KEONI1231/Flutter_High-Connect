import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/component/add_post_screen.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/component/circular_progress_indicator_dialog.dart';
import 'package:per_pro/firebase_database_model/user.dart';
import 'package:per_pro/main.dart';
import 'package:per_pro/screen/boards/free_borad/free_board_detail.dart';
import '../../../constant/color.dart';

class FreeBoard extends StatefulWidget {
  final String postID;
  final loginUser user;
  const FreeBoard({
    required this.postID,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<FreeBoard> createState() => _FreeBoardState();
}

class _FreeBoardState extends State<FreeBoard> {
  @override
  Widget build(BuildContext context) {
    String title = '';
    String content = '';
    String postTime = '';
    String school = '';
    FirebaseFirestore firestore = FirebaseFirestore.instance;

    return Scaffold(
      backgroundColor: BRIGHT_COLOR,
      floatingActionButton: renderFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SafeArea(
        child: Column(
          children: [
            CustomAppBar(titleText: '자유게시판'),
            SizedBox(height: 8),
            SizedBox(height: 8),
            StreamBuilder<QuerySnapshot>(
              stream: firestore.collection(widget.postID).snapshots(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return CircularProgressIndicator(color: PRIMARY_COLOR);
                }
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    //shrinkWrap: true,
                    itemCount: snapshot.data?.docs.length,
                    itemBuilder: (context, index) {
                      title = snapshot.data?.docs[index]['title'];
                      content = snapshot.data?.docs[index]['content'];
                      postTime = snapshot.data?.docs[index]['posted time'];
                      school = snapshot.data?.docs[index]['school'];
                      /*void onBoardTap() {
                          title = snapshot.data?.docs[index]['id'];
                          content = snapshot.data?.docs[index]['email'];
                          print(content);
                          print(title);

                        }*/
                      return test(
                        postTime: postTime,
                        title: title,
                        content: content,
                        school: school,
                        //onTap: onBoardTap,
                      );
                    },
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton.extended(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (BuildContext context) {
            return AddPost(postID: 'post-free-board', user: widget.user);
          }));
        },
        backgroundColor: PRIMARY_COLOR,
        icon: Icon(Icons.add_box_outlined),
        label: Text('글 쓰기'));
  }
}

class test extends StatelessWidget {
  //final GestureTapCallback onTap;
  final String title;
  final String school;
  final String content;
  final String postTime;
  const test({
    required this.school,
    required this.title,
    required this.content,
    required this.postTime,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(color: PRIMARY_COLOR, fontSize: 24);
    final contentStyle = TextStyle(color: Colors.grey[600], fontSize: 18);
    return GestureDetector(
      onTap: () {
        Navigator.of(context)
            .push(MaterialPageRoute(builder: (BuildContext context) {
          return FreeBoardDetail(
            title: title,
            content: content,
            postTime: postTime,
            school: school,
          );
        }));
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 2),
            child: Container(
              width: MediaQuery.of(context).size.width,
              decoration: BoxDecoration(
                border: Border(
                  top: BorderSide(
                    // POINT
                    color: Colors.black,
                    width: 1.0,
                  ),
                  bottom: BorderSide(
                    // POINT
                    color: Colors.black,
                    width: 1.0,
                  ),
                ),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    title,
                    style: titleStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(height: 8),
                  Text(
                    content,
                    style: contentStyle,
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                  ),
                  SizedBox(
                    height: 8,
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Icon(Icons.favorite_border),
                      Text(': 0개'),
                      SizedBox(
                        width: 8,
                      ),
                      Icon(Icons.messenger_outline),
                      Text(': 0개'),
                    ],
                  )
                ],
              ),
            ),
          )
        ],
      ),
    );
  }
}
