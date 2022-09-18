import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:per_pro/component/account_textfield.dart';
import 'package:per_pro/component/alert_dialog.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/component/circular_progress_indicator_dialog.dart';
import 'package:per_pro/constant/color.dart';
import 'package:per_pro/firebase_database_model/user.dart';
import 'package:per_pro/screen/login/find_account_route.dart';
import 'package:per_pro/screen/login/signup_screen.dart';

import '../../component/unFocus.dart';
import '../home_screen.dart';

class login_screen extends StatefulWidget {
  const login_screen({Key? key}) : super(key: key);

  @override
  State<login_screen> createState() => _login_screenState();
}

class _login_screenState extends State<login_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BRIGHT_COLOR,
      body: GestureDetector(
        onTap: unFocused,
        child: SafeArea(
          child:SingleChildScrollView(
            child: Column(
              children: [
                CustomAppBar(titleText: '로그인'),
                Center(
                  child: Column(
                    children: [
                      Image.asset('asset/img/login_screen_logo.png'),
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
          ),
        ),
      ),
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
    //계정찾기(find_account_route.dart) 스크린으로 이동
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return findAccount();
    }));
  }
}

class login_part extends StatefulWidget {
  const login_part({Key? key}) : super(key: key);

  @override
  State<login_part> createState() => _login_partState();
}

class _login_partState extends State<login_part> {
  @override
  Widget build(BuildContext context) {
    FirebaseFirestore firestore = FirebaseFirestore.instance;
    final TextEditingController _idTextController = TextEditingController();
    final TextEditingController _pwTextController = TextEditingController();

    return Padding(
      padding: const EdgeInsets.fromLTRB(48.0, 0, 48, 0),
      child: Column(
        children: [
          CustomTextField(
              textInputType: TextInputType.text,
              Controller: _idTextController,
              label: 'ID입력'),
          SizedBox(height: 16.0),
          CustomTextField(
              textInputType: TextInputType.visiblePassword,
              Controller: _pwTextController,
              label: 'PASSWORD 입력'),
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
              onPressed: () async {
                String id;
                String pw;
                List<String> anonyMessage = [];
                String nickName;
                String realName;
                String mySchool;
                String email;
                String phoneNumber;
                String eduOfficeCode;
                int boolAdmin;
                int boolCertificated;
                int postCount;
                int replCount;
                String createdTime;
                DocumentSnapshot userData;
                try {
                  // try catch.
                  CustomCircular(context, '로그인 중...');
                  userData = await firestore
                      .collection('users')
                      .doc(_idTextController.text)
                      .get();
                  id = userData['id'];
                  pw = userData['pw'];
                  if (id == _idTextController.text &&
                      pw == _pwTextController.text) {
                    nickName = userData['nick name'];
                    realName = userData['real name'];
                    mySchool = userData['my school'];
                    email = userData['email'];
                    phoneNumber = userData['phone number'];
                    eduOfficeCode = userData['edu office code'];
                    boolAdmin = userData['bool Admin'];
                    boolCertificated = userData['bool certificated'];
                    createdTime = userData['created Time'];
                    postCount = userData['post count'];
                    replCount = userData['repl count'];
                    anonyMessage.addAll((List.from(userData['anony message'])));
                    loginUser user = new loginUser(
                      id,
                      nickName,
                      pw,
                      realName,
                      mySchool,
                      eduOfficeCode,
                      email,
                      phoneNumber,
                      anonyMessage,
                      boolAdmin,
                      boolCertificated,
                      createdTime,
                      postCount,
                      replCount,
                    );
                    Navigator.pop(context);
                    Navigator.of(context).push(
                        MaterialPageRoute(builder: (BuildContext context) {
                      return HomeScreen(user: user);
                    }));
                  } else {
                    Navigator.pop(context);
                    DialogShow(context, '회원정보가 잘못되었습니다.');
                  }
                } catch (e) {
                  Navigator.pop(context);
                  DialogShow(context, '시스템 에러');
                }
              },
            ),
          ),
        ],
      ),
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
