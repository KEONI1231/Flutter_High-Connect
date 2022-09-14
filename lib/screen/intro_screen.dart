import 'dart:async';

import 'package:flutter/material.dart';
import '../constant/color.dart';
import 'login/login_screen.dart';

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  State<MyApp> createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  //에뮬레이터 실행시에 처음 보여줄 화면
  // splash screen(로딩중) 이 될 화면. 이 화면은 크게 어려운거 없고 걍 읽어보셈
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: PRIMARY_COLOR,
        body: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Image.asset('asset/img/logo.png'), //고등어 이미지.
            intro_bottom(), //각종 기본적인 텍스트.
            ElevatedButton(
                onPressed: () {
                  Navigator.of(context).push(
                    MaterialPageRoute(
                      builder: (BuildContext context) {
                        return login_screen(); //로그인 화면으로 이동.
                      },
                    ),
                  );
                },
                child: Text('시작하기'))
          ],
        ),
      ),
    );
  }
}

class intro_bottom extends StatefulWidget {
  const intro_bottom({Key? key}) : super(key: key);

  @override
  State<intro_bottom> createState() => _intro_bottomState();
}

class _intro_bottomState extends State<intro_bottom> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(top: 32.0),
      child: Column(
        children: [
          Text(
            'ⓒConnect-High',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            '고등학생들의 커뮤니티',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 11.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
          Text(
            'Test.ver',
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: 10.0,
              color: Colors.white,
              fontWeight: FontWeight.w600,
            ),
          ),
        ],
      ),
    );
  }
}
