import 'package:flutter/material.dart';
import '../constant/color.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Column(
        children: [
          Homestyle('내가 쓴 글'),
          SizedBox(
            height: 5.0,
          ),
          Homestyle('댓글 단 글'),
          SizedBox(
            height: 5.0,
          ),
          Homestyle('스크랩'),
          SizedBox(
            height: 5.0,
          ),
          Homestyle('HOT 게시판'),
          SizedBox(
            height: 5.0,
          ),
          Homestyle('BEST 게시판'),
        ],
      ),
    ));
  }
}

Widget Homestyle(String BoardName) {
  return Container(
    decoration: BoxDecoration(
      color: Colors.white,
      //border: Border.all(width: 2, color: PRIMARY_COLOR),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 100,
            offset: Offset(0, 10))
      ],
    ),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          BoardName,
          style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
        ),
      ],
    ),
  );
}
