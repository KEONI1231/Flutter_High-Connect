import 'package:flutter/material.dart';
import 'package:per_pro/component/account_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import '../constant/color.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _pwTextController = TextEditingController();
  final TextEditingController _repwTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _nicknameTextController = TextEditingController();
  final TextEditingController _realNameTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
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
        backgroundColor: BRIGHT_COLOR,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar(
                backgroundColor: PRIMARY_COLOR,
                title: Text('Sign Up'),
                centerTitle: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(40.0, 40, 40.0, 40),
                child: Form(
                  key: formKey,
                  child: Column(
                    children: [
                      Image.asset('asset/img/login_screen_logo.png'),
                      CustomTextField(
                        label: 'ID입력',
                        Controller: _idTextController,
                        textInputType: TextInputType.text,
                      ),
                      currentPageBtn(
                        text: true,
                        onPressed: onidCheckerPressed,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'password 입력',
                        Controller: _pwTextController,
                        textInputType: TextInputType.visiblePassword,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'password 확인',
                        Controller: _repwTextController,
                        textInputType: TextInputType.visiblePassword,
                        passwordChecker: _pwTextController.text,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'E-MAIL',
                        Controller: _emailTextController,
                        textInputType: TextInputType.emailAddress,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: '닉네임',
                        Controller: _nicknameTextController,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: '실명', // 학교인증용
                        Controller: _realNameTextController,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(
                        height: 16,
                      ),
                      CustomTextField(
                        label: 'Phone Number',
                        Controller: _phoneNumberTextController,
                        textInputType: TextInputType.phone,
                      ),
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

  void onidCheckerPressed() {}
  void onSignUpPressed() {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      firestore.collection('users').doc().set({
        'id': _idTextController.text,
        'pw': _pwTextController.text,
        'real name': _realNameTextController.text,
        'nick name': _nicknameTextController.text,
        'created Time': DateTime.now().toString(),
        'my school': '',
        'email': _emailTextController.text,
        'phone number': _phoneNumberTextController.text,
        'my post': '',
        'my scrap': '',
        'my heart': '',
        'my repl': '',
        'anony message': '',
        'bool Admin': 1,
        'bool certificated': 1,
      });
    } else {


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
          primary: PRIMARY_COLOR,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(8.0))),
      onPressed: onPressed,
      child: text == true
          ? Text('중복확인')
          : Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 35.0,
            ),
    );
  }
}
