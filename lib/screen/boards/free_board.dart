import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/component/add_post_screen.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/firebase_database_model/user.dart';
import 'package:per_pro/main.dart';
import '../../constant/color.dart';

class FreeBoard extends StatefulWidget {
  final loginUser user;
  const FreeBoard({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<FreeBoard> createState() => _FreeBoardState();
}

class _FreeBoardState extends State<FreeBoard> {
  @override
  Widget build(BuildContext context) {
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
              stream: firestore.collection('Apart').snapshots(),
              builder: (context, snapshot) {
                return Expanded(
                  child: ListView.builder(
                    scrollDirection: Axis.vertical,
                    //shrinkWrap: true,
                    itemCount: 100,
                    itemBuilder: (context, index) {
                      return index % 17  == 0
                          ? Image.asset('asset/img/ad_test.png')
                          : test(a: index);
                    },
                  ),
                );
              }
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
  final int a;
  const test({required this.a, Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {

    final titleStyle = TextStyle(color: PRIMARY_COLOR, fontSize: 24);
    final contentStyle = TextStyle(color: Colors.grey[600], fontSize: 18);
    return Column(
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
                Text('제목', style: titleStyle),
                SizedBox(height: 8),
                Text('내용', style: contentStyle),
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
    );
  }
}
