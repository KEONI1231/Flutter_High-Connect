import 'package:flutter/material.dart';

import '../constant/color.dart';

class signUp extends StatelessWidget {
  const signUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _idTextController = TextEditingController(); //아이디 패스워드 필드 컽트롤러
    final _pwTextController = TextEditingController(); //패스워드 필드 컨트롤러
    final _pwTextControllerDupl = TextEditingController(); //패스워드 확인 필드 컨트롤러
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(48.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              TextField(
                decoration: InputDecoration(labelText: 'ID입력'),
                keyboardType: TextInputType.emailAddress,
                controller: _idTextController,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_BACKGROUND,
                ),
                onPressed: () {
                  print(_idTextController.text);
                },
                child: Text('중복확인'),
              ),
              TextField(
                decoration: InputDecoration(labelText: 'PASSWORD 입력'),
                keyboardType: TextInputType.emailAddress,
                controller: _pwTextController,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'PASSWORD 확인'),
                keyboardType: TextInputType.emailAddress,
                controller: _pwTextControllerDupl,
              ),
              TextField(
                decoration: InputDecoration(labelText: 'E-MAIL'),
                keyboardType: TextInputType.emailAddress,
              ),
              TextField(
                decoration: InputDecoration(labelText: '닉네임'),
                keyboardType: TextInputType.emailAddress,
              ),
              SizedBox(
                height: 50,
              ),
              Text('● 이부분은 약관'),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: PRIMARY_BACKGROUND,
                ),
                onPressed: () {},
                child: Icon(
                  Icons.arrow_forward,
                  color: Colors.white,
                  size: 35.0,
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
