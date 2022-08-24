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
  //각 텍스트 릴드의 값을 가지고 오기위한 텍스트컨트롤러 변수들
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _pwTextController = TextEditingController();
  final TextEditingController _repwTextController = TextEditingController();
  final TextEditingController _emailTextController = TextEditingController();
  final TextEditingController _nicknameTextController = TextEditingController();
  final TextEditingController _realNameTextController = TextEditingController();
  final TextEditingController _phoneNumberTextController =
      TextEditingController();
  //텍스트폼필드를 컨트롤 하기위한 변수. 강의에 나오니 알아서 찾아보슈
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        backgroundColor: BRIGHT_COLOR,
        body: SingleChildScrollView(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              AppBar( //걍 평볌한 앱바
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
                      /* CustomTextField는 Component파일에 account_textfield.dart에 정의해둠.
                       텍스트 필드마다 입력시 조건들이 다르기때문에 account_textfield.dart파일에
                       주석으로 달아두겠음.
                       */
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'ID입력',
                        Controller: _idTextController,
                        textInputType: TextInputType.text,
                      ),
                      currentPageBtn(
                        text: true, //text 변수가 true면 버튼안에 '중복확인'이 입력.
                        onPressed: onidCheckerPressed,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'password 입력',
                        Controller: _pwTextController,
                        textInputType: TextInputType.visiblePassword,
                        //passwordChecker: _pwTextController.text,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'password 확인',
                        Controller: _repwTextController,
                        textInputType: TextInputType.visiblePassword,
                        passwordChecker: _pwTextController,
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
                        text: false, //text 가 false 면 버튼안에 내용이 화살표아이콘
                        onPressed: onSignUpPressed, //계정생성 버튼.
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
      //계정 생성버튼을 눌렀을때 이상이 없으면 파이어베이스 클라우드스토어에 유저 정보를 추가한다.
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

//중복확인 버튼과 회원가입완료(화살표아이콘 버튼)을 정의한 stless 위젯.
class currentPageBtn extends StatelessWidget {
  final bool text; //버튼안에 들어갈 내용이 '중복확인' 텍스트인가 화살표아이콘인가를 결정해주는 변수임 164번줄에 이어서 주석달겠음.
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
      child: text == true  // 기본적인 삼항연산자임. text값이 true이면 버튼안의 텍스트가 중복확인으로, false이면 화살표 아이콘이 출력되게 함
          ? Text('중복확인')
          : Icon(
              Icons.arrow_forward,
              color: Colors.white,
              size: 35.0,
            ),
    );
  }
}
