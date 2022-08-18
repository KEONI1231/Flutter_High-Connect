import 'package:flutter/material.dart';
import 'package:per_pro/component/account_textfield.dart';

import '../constant/color.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    final _decoration = InputDecoration(
      //text 필드 데코레이션 정의 변수.
      labelText: 'ID입력',
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );

    return SafeArea(
      child: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: PRIMARY_BACKGROUND,
                title: Text('Sign Up'),
                centerTitle: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 0, 40.0, 0),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image.asset('asset/img/login_screen_logo.png'),
                      CustomTextField(idTextChecker: true, label: 'ID입력'),
                      currentPageBtn(
                        text: true,
                        onPressed: onSignUpPressed,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(idTextChecker: false, label: 'password 입력'),
                      const SizedBox(height: 16),
                      CustomTextField(idTextChecker: false, label: 'password 확인'),
                      const SizedBox(height: 16),
                      CustomTextField(idTextChecker: false, label: 'E-MAIL'),
                      const SizedBox(height: 16),
                      CustomTextField(idTextChecker: false, label: '닉네임'),
                      const SizedBox(height: 16),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text('● 이부분은 약관'),
                      currentPageBtn(
                        text: false,
                        onPressed: onSignUpPressed,
                      ),
                      const SizedBox(height: 50),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onSignUpPressed() {
    //폼키는 생성을 했지만 form위젯과 결합을 안했을때

    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
    } else {
      print('에러발생');
    }
  }
}

class currentPageBtn extends StatelessWidget {
  final bool text;
  final VoidCallback onPressed;
  const currentPageBtn({required this.text, required this.onPressed, Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ElevatedButton.styleFrom(
        primary: PRIMARY_BACKGROUND,
      ),
      onPressed: onPressed,
      child: text == true
          ? Text('중복확인')
          : Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 35.0,
            ),
      /*() {

        showDialog(
          context: context,
          builder: (BuildContext context) {
            // return object of type Dialog
            return AlertDialog(
              content: Text("회원가입 완료"),
              actions: <Widget>[
                new FlatButton(
                  child: Text(
                    "Close",
                  ),
                  onPressed: () {
                    for (int i = 0; i < 2; i++) {
                      Navigator.pop(context);
                    }
                  },
                ),
              ],
            );
          },
        );
      },*/
    );
  }
}
