import 'dart:ffi';
import 'package:flutter/material.dart';
import 'package:per_pro/constant/color.dart';
import 'package:per_pro/screen/certified_screen.dart';
import 'package:per_pro/screen/find_account_screen.dart';
import 'package:per_pro/screen/signup_screen.dart';

import 'home_screen.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          body: Column(
        children: [
          AppBar(
            backgroundColor: PRIMARY_BACKGROUND,
            title: Text('로그인'),
            centerTitle: true,
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image.asset('asset/img/login_screen_logo.png'),
              Padding(
                padding: const EdgeInsets.fromLTRB(48.0, 0, 48.0, 0),
                child: Column(
                  children: [
                    login_part(),
                    bottom_part(
                      onPressed_signup: onPressed_signup_btn,
                      onPressed_findaccount: onPressed_findaccount_btn,
                    ),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
  }

  void onPressed_signup_btn() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return signUp();
    }));
  }

  void onPressed_findaccount_btn() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return findaccount();
    }));
  }

  void onPressed_certified_btn() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return certified_screen();
    }));
  }
}

class login_part extends StatelessWidget {
  const login_part({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        TextField(
          decoration: InputDecoration(labelText: 'Enter "ID"'),
          keyboardType: TextInputType.emailAddress,
        ),
        TextField(
          decoration: InputDecoration(labelText: 'Enter "Password"'),
          keyboardType: TextInputType.text,
          obscureText: true,
        ),
        SizedBox(
          height: 40.0,
        )
      ],
    );
  }
}

class bottom_part extends StatelessWidget {
  final VoidCallback onPressed_signup;
  final VoidCallback onPressed_findaccount;

  const bottom_part({
    required this.onPressed_signup,
    required this.onPressed_findaccount,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonTheme(
          minWidth: 80.0,
          height: 30.0,
          child: RaisedButton(
              //로그인 시도 버튼.
              color: PRIMARY_BACKGROUND,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return HomeScreen();
                }));
              }),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: onPressed_signup,
              child: Text('회원가입'),
            ),
            Text("|"),
            TextButton(
              onPressed: onPressed_findaccount,
              child: Text('아이디찾기'),
            ),
          ],
        ),
      ],
    );
  }
}
