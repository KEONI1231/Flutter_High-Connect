import 'package:flutter/material.dart';
import 'package:per_pro/component/report_anonymessage/report_screen.dart';

import '../../constant/color.dart';

Future ReportMessage(context) async {
  final ts = TextStyle(color: PRIMARY_COLOR);
  return await showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        backgroundColor: BRIGHT_COLOR,
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            GestureDetector(
              onTap: () {
                //신고 탭으로 이동
                Navigator.pop(context);
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (BuildContext context) {
                      return ReportPost();
                    },
                  ),
                );
              },
              child: Text('신고', style: ts),
            ),
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                //쪽지 보내기, 게시물 작성자에게 보내기
                //알람 보내기.
              },
              child: Text('쪽지', style: ts),
            ),
          ],
        ),
        actions: [
          TextButton(
            onPressed: () {
              Navigator.pop(context);
            },
            child: Text('닫기', style: ts),
          ),
        ],
      );
    },
  );
}
