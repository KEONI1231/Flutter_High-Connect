import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/constant/color.dart';
import 'package:per_pro/firebase_database_model/user.dart';
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
          body: SingleChildScrollView(
        child: Column(
          children: [
            AppBar(
              backgroundColor: PRIMARY_COLOR,
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
                        //텍스트 버튼을 모아둔 봄
                        onPressed_signup: onPressed_signup_btn, //회원가입 버튼
                        onPressed_findaccount:
                            onPressed_findaccount_btn, //아이디 찾기 버튼
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ],
        ),
      )),
    );
  }

  void onPressed_signup_btn() {
    //회원가입(signup.dart) 스크린으로 이동
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return signUp();
    }));
  }

  void onPressed_findaccount_btn() {
    //계정찾기(find_account_screen.dart) 스크린으로 이동
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return findaccount();
    }));
  }
}

class login_part extends StatelessWidget {
  const login_part({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final TextEditingController _idTextController = TextEditingController();
    final TextEditingController _pwTextController = TextEditingController();
    return Column(
      children: [
        TextField(
          //아이디 입력하는 텍스트 필드.
          controller: _idTextController, //입력값을 받아오기 위한 텍스트 컨트롤러
          decoration: InputDecoration(labelText: 'Enter "ID"'),
          keyboardType: TextInputType.text,
        ),
        TextField(
          //패스워드 입력하는 택스트 필드
          controller: _pwTextController,
          decoration: InputDecoration(labelText: 'Enter "Password"'),
          keyboardType: TextInputType.text,
          obscureText: true, //패스워드 입력시 문자열이 보이지 않게 해줌
        ),
        SizedBox(
          height: 40.0,
        ),
        ButtonTheme(
          //로그인 성공시 홈화면으로 가게 해주는 네비게이터 버튼. 버튼클릭시
          //클릭시 로그인 성공여부를 확인해줄 로직 추가예정.
          minWidth: 80.0,
          height: 30.0,
          child: ElevatedButton(
            //로그인 시도 버튼.
            style: ElevatedButton.styleFrom(
              primary: PRIMARY_COLOR,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(8.0), //버튼모양 둥글게.
              ),
            ),
            child: Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 35.0,
            ),
            onPressed: () {
              Navigator.of(context).push(
                MaterialPageRoute(
                  builder: (BuildContext context) {
                    return HomeScreen(); //메인 홈스크린.
                  },
                ),
              );

              /*FirebaseFirestore.instance
                  .collection('users')
                  .snapshots()
                  .listen((data) {
                data.docs.forEach(
                  (element) {

                    if (element['id'] == _idTextController.text &&
                        element['pw'] == _pwTextController.text) {
                      Navigator.of(context).push(
                        MaterialPageRoute(
                          builder: (BuildContext context) {
                            return HomeScreen(); //메인 홈스크린.
                          },
                        ),
                      );
                    }
                    else {
                      //로그인 실패

                    }
                  },
                );
              });
              로그인 기능 구현성공 // 개발에 쉽도록 나중에 추가하기로하자
              */
            },
          ),
        ),
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
