import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/component/custom_button.dart';
import '../../constant/color.dart';
import '../custom_AddPost_TextFiled.dart';

class ReportPost extends StatelessWidget {
  const ReportPost({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final TextEditingController contentTextController = TextEditingController();
    final ts = TextStyle(color: PRIMARY_COLOR, fontSize: 20);
    return Scaffold(
      body: SingleChildScrollView(
        child: SafeArea(
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
                    Text('해당 게시물의 신고 사유를 작성해주세요', style: ts),
                    const SizedBox(height: 16),
                    CustomAddPostTextField(
                        controller: contentTextController, isPostTtile: false),
                    const SizedBox(height: 16),
                    CustomButton(text: '제출', istext: true, onPressed:SUBMINTrEPORT),
                    const SizedBox(height: 16),
                    Text('● 해당 게시물, 댓글을 신고 처리하면 영구적으로 해당 게시물을 볼 수 없게됩니다.', style: ts.copyWith(fontSize : 16)),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void SUBMINTrEPORT() {
    FirebaseFirestore firestore = FirebaseFirestore.instance;

  }
}
