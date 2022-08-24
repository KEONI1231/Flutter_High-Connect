import 'package:flutter/material.dart';
import 'package:per_pro/constant/color.dart';
import 'package:per_pro/screen/find_pw_screen.dart';

import 'find_id_screen.dart';
import 'login_screen.dart';

//이화면은 id를 찾을 건지 pw를 찾을지를 물어보는 라우팅화면임. 별로 볼거 없음.
class findaccount extends StatefulWidget {
  const findaccount({Key? key}) : super(key: key);

  @override
  State<findaccount> createState() => _findaccountState();
}

class _findaccountState extends State<findaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BRIGHT_COLOR,
      body: SafeArea(
        child: Column(
          children: [
            AppBar(
              title: Text('계정 찾기'),
              centerTitle: true,
              backgroundColor: PRIMARY_COLOR,
            ),
            Image.asset('asset/img/login_screen_logo.png'),
            SizedBox(height: 48),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 48, 0, 48),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FindIdPwBtn(labelText: 'ID 찾기'),
                  FindIdPwBtn(labelText: 'PW 찾기')
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}

class FindIdPwBtn extends StatelessWidget {
  final String labelText;

  const FindIdPwBtn({
    required this.labelText,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      onPressed: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (BuildContext context) {
              return labelText == 'ID 찾기' ? findId() : findPw();
            },
          ),
        );
      },
      child: Text(labelText),
      style: ElevatedButton.styleFrom(
        minimumSize: Size(150, 30),
        primary: PRIMARY_COLOR,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(15),
        ),
      ),
    );
  }
}
