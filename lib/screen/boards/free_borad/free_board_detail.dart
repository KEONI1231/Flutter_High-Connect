import 'package:flutter/material.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/main.dart';

import '../../../constant/color.dart';

class FreeBoardDetail extends StatefulWidget {
  final String title;
  final String content;
  final String postTime;
  final String school;
  const FreeBoardDetail({
    required this.school,
    required this.title,
    required this.content,
    required this.postTime,
    Key? key,
  }) : super(key: key);

  @override
  State<FreeBoardDetail> createState() => _FreeBoardDetailState();
}

class _FreeBoardDetailState extends State<FreeBoardDetail> {
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
                  widget.title + '\n\n'+widget.content,
                  style: contentStyle,
                ),
              ],
            ),
          ),
        ],
      )),
    );
  }
}
