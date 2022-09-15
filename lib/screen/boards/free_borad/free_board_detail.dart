import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/component/alert_dialog.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/firebase_database_model/user.dart';
import '../../../constant/color.dart';

class FreeBoardDetail extends StatefulWidget {
  final String postID;
  final String title;
  final String content;
  final String postTime;
  final String school;
  final int replCount;
  final int heartCount;
  final int scrapCount;
  final loginUser user;
  const FreeBoardDetail({
    required this.user,
    required this.postID,
    required this.school,
    required this.title,
    required this.content,
    required this.postTime,
    required this.replCount,
    required this.scrapCount,
    required this.heartCount,
    Key? key,
  }) : super(key: key);

  @override
  State<FreeBoardDetail> createState() => _FreeBoardDetailState();
}

class _FreeBoardDetailState extends State<FreeBoardDetail> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final titleStyle = TextStyle(
      color: PRIMARY_COLOR, fontSize: 24, fontWeight: FontWeight.w700);
  final contentStyle = TextStyle(
      color: PRIMARY_COLOR, fontSize: 20, fontWeight: FontWeight.w500);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          CustomAppBar(titleText: '자유게시판'),
          Padding(
            padding: const EdgeInsets.fromLTRB(24, 16, 24, 8),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 8),
                Row(
                  children: [
                    Icon(
                      Icons.account_circle,
                      size: 48,
                      color: PRIMARY_COLOR,
                    ),
                    const SizedBox(width: 8),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(widget.postTime),
                        Text(widget.school),
                      ],
                    ),
                  ],
                ),
                const SizedBox(height: 32),
                Text(
                  widget.title + '\n\n' + widget.content,
                  style: contentStyle,
                ),
                const SizedBox(height: 32),
                Row(
                  children: [
                    GestureDetector(
                        onTap: () async {
                        },
                        child: Icon(Icons.favorite_border)),
                    Text(': ${widget.heartCount}개'),
                    SizedBox(width: 8),
                    Icon(Icons.messenger_outline),
                    Text(': ${widget.replCount}개'),
                    SizedBox(width: 8),
                    Icon(Icons.star_outline),
                    Text(': ${widget.scrapCount}개'),
                  ],
                )
              ],
            ),
          ),
          Liner(),
        ],
      )),
    );
  }
}

class Liner extends StatelessWidget {
  const Liner({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      decoration: BoxDecoration(
        border: Border(
          bottom: BorderSide(
            // POINT
            color: Colors.black,
            width: 1.0,
          ),
        ),
      ),
    );
  }
}
