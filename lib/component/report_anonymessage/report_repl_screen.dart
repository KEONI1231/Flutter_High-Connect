import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import '../../constant/color.dart';
import '../appbar.dart';
import '../custom_AddPost_TextFiled.dart';
import '../custom_button.dart';

class ReportRepl extends StatelessWidget {
  const ReportRepl({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController contentTextController = TextEditingController();
    final ts = TextStyle(color: PRIMARY_COLOR, fontSize: 20);
    return Scaffold(
      body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(
                titleText: '신고',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 16.0, right: 16),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const SizedBox(height: 16),
                    Container(
                      width: MediaQuery.of(context).size.width / 1.1,
                      height: MediaQuery.of(context).size.height / 10,
                      decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(16),
                        boxShadow: [
                          BoxShadow(
                              color: Colors.grey.withOpacity(0.5),
                              spreadRadius: 1,
                              blurRadius: 7,
                              offset: Offset(0, 10))
                        ],
                      ),
                      child: Center(
                        child: Text('해당 댓글의 신고 사유를 작성해주세요', style: ts),
                      ),
                    ),
                    const SizedBox(height: 16),
                    CustomAddPostTextField(
                        controller: contentTextController, isPostTtile: false),
                    const SizedBox(height: 16),
                    CustomButton(
                        text: '제출', istext: true, onPressed: SubmitReport),
                    const SizedBox(height: 16),
                    Text('● 해당 게시물, 댓글을 신고 처리하면 영구적으로 해당 게시물을 볼 수 없게됩니다.',
                        style: ts.copyWith(fontSize: 16)),
                    Text('\n● 추후 해당 게시물에 문제가 없다고 판단될시에 해당 게시물은 정상적으로 복구됩니다.', style: ts.copyWith(fontSize : 16)),
                  ],
                ),
              )
            ],
          ),

      ),
    );
  }

  void SubmitReport() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

  }
}
