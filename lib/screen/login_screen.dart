import 'package:flutter/material.dart';
import 'package:per_pro/constant/color.dart';

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
                    bottom_part(),
                  ],
                ),
              ),
            ],
          ),
        ],
      )),
    );
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
  const bottom_part({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ButtonTheme(
          minWidth: 80.0,
          height: 30.0,
          child: RaisedButton(
              color: PRIMARY_BACKGROUND,
              child: Icon(
                Icons.arrow_forward,
                color: Colors.white,
                size: 35.0,
              ),
              onPressed: () {}),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextButton(
              onPressed: () {},
              child: Text('회원가입'),
            ),
            Text("|"),
            TextButton(
              onPressed: () {},
              child: Text('아이디찾기'),
            ),
          ],
        ),
      ],
    );
  }
}
