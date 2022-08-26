import 'package:flutter/material.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      child: Column(
        children: [
          Homestyle('내가 쓴 글'),
          SizedBox(
            height: 3.0,
          ),
          Homestyle('댓글 단 글'),
          SizedBox(
            height: 3.0,
          ),
          Homestyle('스크랩'),
          SizedBox(
            height: 3.0,
          ),
          Homestyle('HOT 게시판'),
          SizedBox(
            height: 3.0,
          ),
          Homestyle('BEST 게시판'),
        ],
      ),
    );
  }
}

Widget Homestyle(String BoardName) {
  return Container(
    child: Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: [
        Text(
          BoardName,
          style: TextStyle(
            fontWeight: FontWeight.w900,
            fontSize: 20
          ),
        ),
      ],
    ),
  );
}
