import 'package:flutter/material.dart';
import 'package:per_pro/constant/color.dart';

class BoardScreen extends StatelessWidget {
  const BoardScreen({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Column(
        children: [
          Column(
            children: [
              mypage(),     // 내 글들 모음
              totalboard(), // 게시판 모음
              subboard(),   // 서브 게시판 모음
             ],
          ),
        ],
      ),
    );
  }
}

class mypage extends StatelessWidget {
  const mypage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 10))
      ],
    );
    final ts = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w700, color: PRIMARY_COLOR);
    final tsContent = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PRIMARY_COLOR,
        overflow: TextOverflow.ellipsis);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: ContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('내가 쓴 글', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('댓글 단 글', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('스크랩', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('HOT 게시판', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('BEST 게시판', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class totalboard extends StatelessWidget {
  const totalboard({Key? key}) : super(key: key);
  //totalboard = 게시판 모음
  @override
  Widget build(BuildContext context) {
    final ContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 10))
      ],
    );
    final ts = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w700, color: PRIMARY_COLOR);
    final tsContent = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PRIMARY_COLOR,
        overflow: TextOverflow.ellipsis);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: ContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                Row(
                  children: [
                    Text('자유게시판', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('워드클라우드', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('연애게시판', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('급식 게시판', style: ts),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
class subboard extends StatelessWidget {
  const subboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContainerDecoration = BoxDecoration(
      color: Colors.white,
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 10))
      ],
    );
    final ts = TextStyle(
        fontSize: 18, fontWeight: FontWeight.w700, color: PRIMARY_COLOR);
    final tsContent = TextStyle(
        fontSize: 15,
        fontWeight: FontWeight.w500,
        color: PRIMARY_COLOR,
        overflow: TextOverflow.ellipsis);
    return SafeArea(
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: ContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              children: [
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('오늘의 급식', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('교원 평가', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('스터디', style: ts),
                    SizedBox(width: 24),
                  ],
                ),
                SizedBox(height: 16),
                Row(
                  children: [
                    Text('중고 거래', style: ts),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}