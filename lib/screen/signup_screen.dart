import 'package:flutter/material.dart';

import '../constant/color.dart';

class signUp extends StatelessWidget {
  const signUp({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final _idTextController = TextEditingController(); //아이디 패스워드 필드 컽트롤러
    final _pwTextController = TextEditingController(); //패스워드 필드 컨트롤러
    final _pwTextControllerDupl = TextEditingController(); //패스워드 확인 필드 컨트롤러
    final _decoration = InputDecoration(
      //text 필드 데코레이션 정의 함수.
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
                child: Column(
                  children: [
                    Image.asset('asset/img/login_screen_logo.png'),
                    TextField(
                      decoration: _decoration,
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
                    const SizedBox(height: 16),
                    TextField(
                      decoration:
                          _decoration.copyWith(labelText: 'PASSWORD 입력'),
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration:
                          _decoration.copyWith(labelText: 'PASSWORD 확인'),
                      keyboardType: TextInputType.emailAddress,
                      controller: _pwTextControllerDupl,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: _decoration.copyWith(labelText: 'E-MAIL'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    TextField(
                      decoration: _decoration.copyWith(labelText: '닉네임'),
                      keyboardType: TextInputType.emailAddress,
                    ),
                    const SizedBox(height: 16),
                    const SizedBox(
                      height: 50,
                    ),
                    Text('● 이부분은 약관'),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: PRIMARY_BACKGROUND,
                      ),
                      onPressed: () {
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
                      },
                      child: Icon(
                        Icons.arrow_forward,
                        color: Colors.white,
                        size: 35.0,
                      ),
                    ),
                    const SizedBox(height: 50),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
