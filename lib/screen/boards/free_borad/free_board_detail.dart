import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/component/alert_dialog.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/component/circular_progress_indicator_dialog.dart';
import 'package:per_pro/component/custom_add_repl_textfiled.dart';
import 'package:per_pro/component/unFocus.dart';
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
  final String postValue;

  const FreeBoardDetail({
    required this.postValue,
    required this.postID,
    required this.user,
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
  bool? _isChecked = false;
  final TextEditingController replContent = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  final titleStyle = TextStyle(
      color: PRIMARY_COLOR, fontSize: 24, fontWeight: FontWeight.w700);
  final contentStyle = TextStyle(
      color: PRIMARY_COLOR, fontSize: 20, fontWeight: FontWeight.w500);
  final defaultTs = TextStyle(color: PRIMARY_COLOR, fontSize: 16);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: unFocused,
        child: SafeArea(
            child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ReplView(
              postValue: 'post-free-board',
              user: widget.user,
              postTime: widget.postTime,
              replCount: widget.replCount,
              heartCount: widget.heartCount,
              content: widget.content,
              title: widget.title,
              school: widget.school,
              scrapCount: widget.scrapCount,
              postID: widget.postID,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 16),
              child: Form(
                key: formKey,
                child: Column(
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          '익명',
                          style: defaultTs,
                        ),
                        Checkbox(
                          value: _isChecked,
                          checkColor: BRIGHT_COLOR,
                          activeColor: PRIMARY_COLOR,
                          onChanged: (value) {
                            setState(() {
                              _isChecked = value;
                            });
                          },
                        ),
                        const SizedBox(width: 16),
                        GestureDetector(
                          onTap: addRepl,
                          child: const Icon(
                            Icons.done,
                            color: PRIMARY_COLOR,
                            size: 40,
                          ),
                        )
                      ],
                    ),
                    CustomAddReplTextField(
                        Controller: replContent, label: '댓글 작성')
                  ],
                ),
              ),
            ),
          ],
        )),
      ),
    );
  }

  void addRepl() async {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      widget.user.replCount++;
      CustomCircular(context, '댓글 다는중...');
      await firestore
          .collection('users')
          .doc(widget.user.ID)
          .update({'repl count': widget.user.postCount});
      await firestore
          .collection(widget.postValue)
          .doc(widget.postID)
          .update({'repl count': FieldValue.increment(1)});
      await firestore
          .collection(widget.postValue)
          .doc(widget.postID)
          .collection('repl')
          .doc(widget.user.ID + widget.user.replCount.toString() + '!@#')
          .set({
        'repl content': replContent.text,
        'repl id': widget.user.ID + widget.user.replCount.toString() + '!@#',
        'repl heart': 0,
        'repled time': DateTime.now().toString(),
      });
      Navigator.pop(context);
      DialogShow(context, '댓글을 작성했습니다!');
    }
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
  final String postValue;

  const ReplView({
    required this.postID,
    required this.postValue,
    required this.user,
    required this.heartCount,
    required this.scrapCount,
    required this.school,
    required this.replCount,
    required this.postTime,
    required this.title,
    required this.content,
    Key? key,
  }) : super(key: key);

  @override
  State<ReplView> createState() => _ReplViewState();
}

class _ReplViewState extends State<ReplView> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  String test = '';
  String test1 = '';

  @override
  Widget build(BuildContext context) {
    final titleStyle = TextStyle(color: PRIMARY_COLOR, fontSize: 20);
    final contentStyle = TextStyle(color: Colors.grey[600], fontSize: 14);
    return StreamBuilder<QuerySnapshot>(
      stream: firestore
          .collection(widget.postValue)
          .doc(widget.postID)
          .collection('repl')
          .where('repled time', isNotEqualTo: "0")
          .orderBy('repled time', descending: true)
          .snapshots(),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return CircularProgressIndicator(color: PRIMARY_COLOR);
        }
        //snapshot.data!.docs.length

        return Expanded(
          child: CustomScrollView(
            slivers: [
              const SliverAppBar(
                centerTitle: true,
                backgroundColor: PRIMARY_COLOR,
                title: Text('자유게시판'),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                    return Column(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(16, 16, 16, 8),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              const SizedBox(height: 8),
                              Row(
                                children: [
                                  const Icon(
                                    Icons.account_circle,
                                    size: 48,
                                    color: PRIMARY_COLOR,
                                  ),
                                  const SizedBox(width: 8),
                                  Column(
                                    crossAxisAlignment:
                                    CrossAxisAlignment.start,
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
                                    child: Icon(Icons.favorite_border),
                                  ),
                                  Text(': ${widget.heartCount}개'),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.messenger_outline),
                                  Text(': ${widget.replCount}개'),
                                  const SizedBox(width: 8),
                                  const Icon(Icons.star_outline),
                                  Text(': ${widget.scrapCount}개'),
                                ],
                              )
                            ],
                          ),
                        ),
                        const SizedBox(height: 32),
                        const Liner(),
                        const SizedBox(height: 16),
                      ],
                    );
                  },
                  childCount: 1,
                ),
              ),
              SliverList(
                delegate: SliverChildBuilderDelegate(
                      (BuildContext context, int index) {
                        if (snapshot.data!.docs.length != 0) {
                          test = snapshot.data?.docs[index]['repl content'];
                        }
                    return Column(
                      children: [
                        Padding(
                          padding: EdgeInsets.fromLTRB(16, 0, 16, 2),
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
                                  test,
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
                                  ],
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    );
                  },
                  childCount: snapshot.data!.docs.length,
                ),
              ),
            ],
          ),
        );
      },
    );
  }


  void onHeartClick() async {
    //좋아요 함수
    DocumentSnapshot postData =
    await firestore.collection(widget.postValue).doc(widget.postID).get();
    final List heartUserList = List<String>.from(postData['heart user'] ?? []);
    if (heartUserList.contains(widget.user.ID) == false) {
      //좋아요를 달지 않은 상태일때
      heartUserList.add(widget.user.ID);
      CustomCircular(context, '좋아요 등록중...');
      await firestore.collection(widget.postValue).doc(widget.postID).update({
        'heart user': heartUserList,
        'heart count': heartUserList.length - 1,
      });
      Navigator.pop(context);
      DialogShow(context, '좋아요를 달았습니다');
    } else if (heartUserList.contains(widget.user.ID) == true) {
      //좋아요를 달았을때와 좋아요 수가 0개 일때
      heartUserList.remove(widget.user.ID);
      CustomCircular(context, '좋아요 지우는 중...');
      await firestore.collection(widget.postValue).doc(widget.postID).update({
        'heart user': heartUserList,
        'heart count': heartUserList.length - 1,
      });
      Navigator.pop(context);
      DialogShow(context, '좋아요를 지웠습니다');
    }

    //print(heartUserList);
    //print(widget.user.ID);
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
            color: Colors.black,
            width: 0.5,
          ),
        ),
      ),
    );
  }
}
