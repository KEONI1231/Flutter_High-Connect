import 'package:flutter/material.dart';

import '../../constant/color.dart';

class certified_screen extends StatefulWidget {
  const certified_screen({Key? key}) : super(key: key);

  @override
  State<certified_screen> createState() => _certified_screenState();
}

class _certified_screenState extends State<certified_screen> {
  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontWeight: FontWeight.w900, color: PRIMARY_COLOR, fontSize: 20);
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              title: Text('학교 인증'),
              centerTitle: true,
              backgroundColor: PRIMARY_COLOR,
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset('asset/img/login_screen_logo.png'), //고등어 이미지.
                Text(
                  '학교 인증을 진행합니다.',
                  style: ts,
                ),
                Text(
                  '학생증, 나이스, 학적기록부 등 학생임을 인증할 수 있는 자료를 업로드 해주세요.',
                  style: ts.copyWith(fontSize: 11),
                ),
                const SizedBox(
                  height: 16,
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text('첨부파일 업로드'),
                  style: ElevatedButton.styleFrom(
                      primary: PRIMARY_COLOR,
                      minimumSize: Size(196, 40),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(15))),
                ),
                Text('고등어 이미지 수정시급!!!!! \n 이미지가 삐뚤다!!!!')
              ],
            ),
          ],
        ),
      ),
    );
  }
}
