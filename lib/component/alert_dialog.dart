import 'package:flutter/material.dart';

import '../constant/color.dart';

Future DialogShow( context,String contentText) async {
  final ts = TextStyle(color: PRIMARY_COLOR);
  return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: BRIGHT_COLOR,
          title: Text('알림',style: ts),
          content: Text(contentText,style: ts),
          actions: [
            TextButton(
              onPressed: () {

                Navigator.pop(context); //이부분 에러가 있는거 같음. 확인 버튼을 왜4번이나 눌러야 되는지 모르겠

              },
              child: Text('확인', style: ts),
            ),
          ],
        );
      });
}