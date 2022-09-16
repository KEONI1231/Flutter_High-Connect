import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/component/add_post_screen.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/firebase_database_model/user.dart';
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
    String postID = '';
    int heartCount = 0;
    int replCount = 0;
    int scrapCount = 0;
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
              stream: firestore
                  .collection(widget.postID)
                  .orderBy('posted time', descending: true)
                  .snapshots(),
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
                      heartCount = snapshot.data?.docs[index]['heart count'];
                      replCount = snapshot.data?.docs[index]['repl count'];
                      scrapCount = snapshot.data?.docs[index]['scrap count'];
                      postID = snapshot.data?.docs[index]['post id'];
                      return PostContents(
                        postTime: postTime,
                        title: title,
                        content: content,
                        school: school,
                        replCount: replCount,
                        scrapCount: scrapCount,
                        heartCount: heartCount,
                        postID: postID,
                        user: widget.user,
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
            return AddPost(postValue: 'post-free-board', user: widget.user);
          }));
        },
        backgroundColor: PRIMARY_COLOR,
        icon: Icon(Icons.add_box_outlined),
        label: Text('글 쓰기'));
  }
}

class PostContents extends StatelessWidget {
  //final GestureTapCallback onTap;
  final String title;
  final String school;
  final String content;
  final String postTime;
  final int replCount;
  final int scrapCount;
  final int heartCount;
  final String postID;
  final loginUser user;
  const PostContents({
    required this.user,
    required this.school,
    required this.title,
    required this.content,
    required this.postTime,
    required this.replCount,
    required this.scrapCount,
    required this.heartCount,
    required this.postID,
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
            postID: postID,
            heartCount: heartCount,
            replCount: replCount,
            scrapCount: scrapCount,
            title: title,
            content: content,
            postTime: postTime,
            school: school,
            user: user,
          );
        }));
      },
      child: Column(
        children: [
          Padding(
            padding: EdgeInsets.fromLTRB(8, 0, 8, 2),
            child: Container(
              width: MediaQuery.of(context).size.width,
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
                      Text(': $heartCount개'),
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
