import 'package:flutter/material.dart';
import 'package:per_pro/component/account_textfield.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:per_pro/component/alert_dialog.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/component/circular_progress_indicator_dialog.dart';
import '../../component/custom_button.dart';
import '../../constant/color.dart';

class signUp extends StatefulWidget {
  const signUp({Key? key}) : super(key: key);

  @override
  State<signUp> createState() => _signUpState();
}

class _signUpState extends State<signUp> {
  //각 텍스트 릴드의 값을 가지고 오기위한 텍스트컨트롤러 변수들
  FirebaseFirestore firestore = FirebaseFirestore.instance;
  final TextEditingController _idTextController = TextEditingController();
  final TextEditingController _schoolTextController = TextEditingController();
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
              CustomAppBar(titleText: 'Sign UP'),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
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
                      CustomButton(
                        istext: true,
                        text: 'ID 중복체크', //text 가 false 면 버튼안에 내용이 화살표아이콘
                        onPressed: onCheckIdPressed, //계정생성 버튼.
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
                      CustomButton(
                          text: '닉네임 중복체크',
                          istext: true,
                          onPressed: onCheckNickNamePressed),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: '실명', // 학교인증용
                        Controller: _realNameTextController,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: '학교', // 학교인증용
                        Controller: _schoolTextController,
                        textInputType: TextInputType.text,
                      ),
                      const SizedBox(height: 16),
                      CustomTextField(
                        label: 'Phone Number',
                        Controller: _phoneNumberTextController,
                        textInputType: TextInputType.phone,
                      ),
                      const SizedBox(
                        height: 50,
                      ),
                      const Text('● 이부분은 약관'),
                      CustomButton(
                        text: '',
                        istext: false, //text 가 false 면 버튼안에 내용이 화살표아이콘
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

  int _duplicationIdCheck = 0;
  int _duplbtnidchecker = 0;
  int _duplicationNickCheck = 1;
  int _duplbtnnickchecker = 0;
  void onCheckIdPressed() async {
    DocumentSnapshot userData;
    try {
      CustomCircular(context, '중복 확인 중...');
      userData =
          await firestore.collection('users').doc(_idTextController.text).get();
      if (_idTextController.text == userData['id']) {
        Navigator.pop(context);
        DialogShow(context, '중복된 아이디가 존재합니다.');
      }
    } catch (e) {
      Navigator.pop(context);
      DialogShow(context, '사용 가능한 ID입니다.');
      _duplicationIdCheck = 1;
      _duplbtnidchecker = 1;
    }
  }

  int checker = 0;
  void onCheckNickNamePressed() async {
    CustomCircular(context, '중복 확인 중...');
    await firestore.collection('users').snapshots().listen((data) {
      data.docs.forEach((element) {
        if (element['nick name'] == _nicknameTextController.text) {
          _duplicationNickCheck = 0;
          _duplbtnnickchecker = 0;
          Navigator.pop(context);
          DialogShow(context, '중복된 닉네임이 존재합니다.');
          return;
        } else
          _duplicationNickCheck = 1;
      });
    });
    if (_duplicationNickCheck != 0) {
      Navigator.pop(context);
      DialogShow(context, '사용 가능한 닉네임입니다.');
      _duplicationNickCheck = 1;
      _duplbtnnickchecker = 1;
    }
  }

  void onSignUpPressed() {
    //_duplicationIdCheck = 0;
    if (_duplicationIdCheck == 1 &&
        _duplbtnidchecker == 1 &&
        _duplicationNickCheck == 1 &&
        _duplbtnnickchecker == 1) {
      createAccount();
    } else {
      DialogShow(context, '중복체크를 진행해주세요.');
    }
  }

  void createAccount() async {
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {
      //계정 생성버튼을 눌렀을때 이상이 없으면 파이어베이스 클라우드스토어에 유저 정보를 추가한다.
      CustomCircular(context, '회원가입 진행중...');
      await firestore.collection('users').doc(_idTextController.text).set({
        'id': _idTextController.text,
        'pw': _pwTextController.text,
        'real name': _realNameTextController.text,
        'nick name': _nicknameTextController.text,
        'created Time': DateTime.now().toString(),
        'my school': _schoolTextController.text,
        'email': _emailTextController.text,
        'phone number': _phoneNumberTextController.text,
        'my post': [''],
        'my scrap': [''],
        'my heart': [''],
        'my repl': [''],
        'anony message': [''],
        'bool Admin': 1,
        'bool certificated': 1,
      });
      Navigator.pop(context);
      Navigator.pop(context);
      DialogShow(context, '회원가입이 완료되었습니다.');
    }
  }
}
