import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/component/account_textfield.dart';
import 'package:per_pro/component/alert_dialog.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/component/custom_add_repl_textfiled.dart';
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
  final TextEditingController test = TextEditingController();
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
          const SizedBox(height: 16),
          ReplView(
            postTime: widget.postTime,
            replCount: widget.replCount,
            heartCount: widget.heartCount,
            content: widget.content,
            title: widget.title,
            school: widget.school,
            user: widget.user,
            scrapCount: widget.scrapCount,
            postID: widget.postID,
          ),
          CustomAddReplTextField(Controller: test, label: '댓글 작성'),
        ],
      )),
    );
  }
}

class Liner extends StatelessWidget {
  //본문과 댓글을 구분하기 위한 라인
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

class ReplView extends StatefulWidget {
  final int heartCount;
  final int scrapCount;
  final int replCount;
  final String school;
  final String postTime;
  final String title;
  final String content;
  final loginUser user;
  final String postID;
  const ReplView({
    required this.user,
    required this.heartCount,
    required this.scrapCount,
    required this.school,
    required this.replCount,
    required this.postTime,
    required this.title,
    required this.content,
    required this.postID,
    Key? key,
  }) : super(key: key);

  @override
  State<ReplView> createState() => _ReplViewState();
}

class _ReplViewState extends State<ReplView> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(color: PRIMARY_COLOR, fontSize: 20);
    final contentStyle = TextStyle(color: Colors.grey[600], fontSize: 14);
    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection('post-free-board')
          .doc(widget.postID)
          .collection('repl')
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
              return Column(
                children: [
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
                        Text(widget.title, style: titleStyle),
                        Text(
                          '\n\n' + widget.content,
                          style: contentStyle,
                        ),
                        const SizedBox(height: 32),
                        Row(
                          children: [
                            GestureDetector(
                                onTap: onHeartClick,
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
                  Column(
                    children: [
                      Padding(
                        padding: EdgeInsets.fromLTRB(8, 0, 8, 2),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 16),
                              Row(
                                children: [
                                  Icon(
                                    Icons.account_circle,
                                    color: PRIMARY_COLOR,
                                  ),
                                  const SizedBox(width: 8),
                                  Text(
                                    '익명',
                                    style: titleStyle,
                                    maxLines: 1,
                                    overflow: TextOverflow.ellipsis,
                                  ),
                                ],
                              ),
                              SizedBox(height: 8),
                              Text(
                                '웅앵',
                                style: contentStyle,
                                maxLines: 1,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
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
                ],
              );
            },
          ),
        );
      },
    );
  }

  void onHeartClick() async {
    //좋아요 함수
    DocumentSnapshot postData =
        await firestore.collection('post-free-board').doc(widget.postID).get();
    final List heartUserList = List<String>.from(postData['heart user'] ?? []);
    if (heartUserList.contains(widget.user.ID) == false) {
      //좋아요를 달지 않은 상태일때
      heartUserList.add(widget.user.ID);
      await firestore.collection('post-free-board').doc(widget.postID).update({
        'heart user': heartUserList,
        'heart count': heartUserList.length - 1,
      });
      print(heartUserList);
      DialogShow(context, '좋아요를 달았습니다');
    } else if (heartUserList.contains(widget.user.ID) == true) {
      //좋아요를 달았을때와 좋아요 수가 0개 일때
      heartUserList.remove(widget.user.ID);
      await firestore.collection('post-free-board').doc(widget.postID).update({
        'heart user': heartUserList,
        'heart count': heartUserList.length - 1,
      });
      DialogShow(context, '좋아요를 지웠습니다');
    }

    //print(heartUserList);
    //print(widget.user.ID);
  }
}
