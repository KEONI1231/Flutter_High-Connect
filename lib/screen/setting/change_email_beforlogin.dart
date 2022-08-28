import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/constant/color.dart';
import 'package:per_pro/component/account_textfield.dart';
import 'package:per_pro/screen/setting/change_email.dart';

import '../../component/alert_dialog.dart';

class ChangeEmailLogin extends StatefulWidget {
  const ChangeEmailLogin({Key? key}) : super(key: key);

  @override
  State<ChangeEmailLogin> createState() => _ChangeEmailLoginState();
}

class _ChangeEmailLoginState extends State<ChangeEmailLogin> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController _currentEmailController = TextEditingController();
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _passwordTextController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(color: PRIMARY_COLOR);
    return Scaffold(
      backgroundColor: BRIGHT_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(titleText: '계정잧기'),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 8),
                    CustomTextField(
                      textInputType: TextInputType.text,
                      Controller: _idTextController,
                      label: '계정 아이디',
                    ),
                    const SizedBox(height: 16),
                    CustomTextField(
                      textInputType: TextInputType.visiblePassword,
                      Controller: _passwordTextController,
                      label: '계정 비밀번호',
                    ),
                    const SizedBox(height: 24),
                    ChangeEmailBtn(
                      text: '계정 확인',
                      onChangeEmail: onChangeEmail,
                    ),
                  ],
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
  void onChangeEmail() {
    bool login_succ;
    FirebaseFirestore.instance
        .collection('users')
        .snapshots()
        .listen((data) {
      data.docs.forEach(
            (element) {
          if (element['id'] == _idTextController.text &&
              element['pw'] == _passwordTextController.text) {
            Navigator.of(context).push(
              MaterialPageRoute(
                builder: (BuildContext context) {
                  login_succ = true;
                  return ChangeEmail();
                  //메인 홈스크린.
                },
              ),
            );
          }
        },
      );
    });
    /*
    FirebaseFirestore.instance.
    collection('users')
        .doc('Seoul')
        .update({'name': 'Seoul'});
  */
  }
}
class ChangeEmailBtn extends StatelessWidget {
  final VoidCallback onChangeEmail;
  final String text;
  const ChangeEmailBtn({
    required this.text,
    required this.onChangeEmail
    ,Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: ElevatedButton(
        onPressed: onChangeEmail,
        child: Text(text),
        style: ElevatedButton.styleFrom(
            primary: PRIMARY_COLOR,
            minimumSize: Size(150, 40),
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(16),
            ),
        ),
      ),
    );
  }
}