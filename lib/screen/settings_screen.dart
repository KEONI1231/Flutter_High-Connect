import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/component/circle_button.dart';
import 'package:per_pro/firebase_database_model/user.dart';
import 'package:per_pro/screen/setting/ProfileCard/certified_screen.dart';
import 'package:per_pro/screen/login/signup_screen.dart';
import 'package:per_pro/screen/setting/ProfileCard/mypost.dart';
import 'package:per_pro/component/custom_send_mail.dart';
import 'package:per_pro/screen/setting/etc_screen/user_delete_beforlogin_screen.dart';
import 'package:per_pro/screen/setting/personal_account_setting/change_email_beforlogin.dart';
import 'package:per_pro/screen/setting/personal_account_setting/change_nickname_beforeLogin.dart';
import 'package:per_pro/screen/setting/personal_account_setting/change_pw_screen.dart';
import '../constant/color.dart';

class SettingScreen extends StatelessWidget {
  final loginUser user;

  const SettingScreen({
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ContainerDecoration = BoxDecoration(
      color: Colors.white,
      //border: Border.all(width: 2, color: PRIMARY_COLOR),
      borderRadius: BorderRadius.circular(16),
      boxShadow: [
        BoxShadow(
            color: Colors.grey.withOpacity(0.5),
            spreadRadius: 1,
            blurRadius: 7,
            offset: Offset(0, 10))
      ],
    );
    final ts = TextStyle(
        fontWeight: FontWeight.w900, color: PRIMARY_COLOR, fontSize: 18);
    return SafeArea(
      child: Scaffold(
        backgroundColor: BRIGHT_COLOR,
        body: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(titleText: '설정'),
              const SizedBox(height: 24),
              Text('프로필수정', style: ts),
              const SizedBox(height: 16),
              ProfileCard(user: user, ContainerDecoration: ContainerDecoration),
              const SizedBox(height: 32),
              Text('개인/계정 설정', style: ts),
              const SizedBox(height: 16),
              PersonalAccountSetting(
                  user: user, ContainerDecoration: ContainerDecoration),
              const SizedBox(height: 32),
              Text('앱 설정', style: ts),
              const SizedBox(height: 16),
              AppSetting(ContainerDecoration: ContainerDecoration),
              const SizedBox(height: 24),
              Text('기타', style: ts),
              const SizedBox(height: 16),
              EtcSetting(user: user, ContainerDecoration: ContainerDecoration),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatefulWidget {
  final loginUser user;
  final BoxDecoration ContainerDecoration;

  const ProfileCard({
    required this.ContainerDecoration,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  State<ProfileCard> createState() => _ProfileCardState();
}

class _ProfileCardState extends State<ProfileCard> {
  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontWeight: FontWeight.w700, color: PRIMARY_COLOR, fontSize: 12);
    return Padding(
      padding: const EdgeInsets.only(left: 16.0, right: 16, bottom: 16),
      child: Container(
        decoration: BoxDecoration(
          color: Colors.white,
          //border: Border.all(width: 2, color: PRIMARY_COLOR),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 10))
          ],
        ),
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 16, 0, 16),
          child: Column(
            children: [
              //const SizedBox(width: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const SizedBox(height:8),
                      Text(
                        '이름 : ${widget.user.realName}',
                        style: ts.copyWith(fontSize: 15),
                      ),
                      const SizedBox(height: 8),
                      Text('닉네임 : ${widget.user.nickName}',
                          style: ts.copyWith(fontSize: 15)),
                      const SizedBox(height: 8),
                      Text('학교 : ${widget.user.mySchool}',
                          style: ts.copyWith(fontSize: 15))
                    ],
                  ),
                  OutlinedButton(
                    style: OutlinedButton.styleFrom(
                        primary: PRIMARY_COLOR,
                        minimumSize: Size(80, 30),
                        side: BorderSide(
                          color: PRIMARY_COLOR,
                          width: 1,
                        )),
                    onPressed: () {
                      Navigator.of(context).push(
                          MaterialPageRoute(builder: (BuildContext context) {
                        return certified_screen(user: widget.user, ContainerDecoration:widget.ContainerDecoration,);
                      }));
                    },
                    child: Text(
                      '학교 인증하기',
                      style: ts.copyWith(fontSize: 12),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 24),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                children: [
                  CircleButton(
                      buttonText: '내가 쓴 내용', ts: ts, onPressed: onMyPost),
                  CircleButton(
                      buttonText: '댓글 단 글들', ts: ts, onPressed: onMyRepl),
                  CircleButton(
                      buttonText: '모은  스크랩', ts: ts, onPressed: onMyScrap)
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  void onMyPost() {
    Navigator.of(context)
        .push(MaterialPageRoute(builder: (BuildContext context) {
      return myPost(
        ContainerDecoration: widget.ContainerDecoration,
      );
    }));
  }

  void onMyRepl() {}

  void onMyScrap() {}
}

class PersonalAccountSetting extends StatelessWidget {
  final loginUser user;
  final BoxDecoration ContainerDecoration;

  const PersonalAccountSetting({
    required this.ContainerDecoration,
    required this.user,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontWeight: FontWeight.w900, color: PRIMARY_COLOR, fontSize: 14);

    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: ContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 0, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return certified_screen(user: user,ContainerDecoration: ContainerDecoration);
                  }));
                },
                child: Text(
                  '학교인증',
                  style: ts,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ChangePassword(user: user);
                  }));
                },
                child: Text(
                  '비밀번호 변경',
                  style: ts,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ChangeEmailLogin(user: user);
                  }));
                },
                child: Text(
                  '이메일 변경',
                  style: ts,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return ChangeNickbeforLogin(user: user);
                  }));
                },
                child: Text(
                  '닉네임 변경',
                  style: ts,
                ),
              ),
              const SizedBox(height: 16),
            ],
          ),
        ),
      ),
    );
  }
}

class AppSetting extends StatelessWidget {
  final BoxDecoration ContainerDecoration;

  const AppSetting({
    required this.ContainerDecoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontWeight: FontWeight.w900, color: PRIMARY_COLOR, fontSize: 14);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: ContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    '앱 버전',
                    style: ts,
                  ),
                  Text('V0.0.1',
                      style: ts.copyWith(fontSize: 13, color: Colors.grey)),
                ],
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return signUp();
                  }));
                },
                child: Text(
                  '다크모드 on / off',
                  style: ts,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return signUp();
                  }));
                },
                child: Text(
                  '알림 설정',
                  style: ts,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class EtcSetting extends StatelessWidget {
  final loginUser user;
  final BoxDecoration ContainerDecoration;

  const EtcSetting({
    required this.user,
    required this.ContainerDecoration,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontWeight: FontWeight.w900, color: PRIMARY_COLOR, fontSize: 14);
    return Padding(
      padding: const EdgeInsets.only(left: 8.0, right: 8.0, bottom: 8.0),
      child: Container(
        width: MediaQuery.of(context).size.width / 1.1,
        decoration: ContainerDecoration,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(8, 16, 8, 16),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return DeleteAccount(user : user);
                  }));
                },
                child: Text(
                  '회원탈퇴',
                  style: ts,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  _onPowerKey(context, ts);
                },
                child: Text(
                  '로그아웃',
                  style: ts,
                ),
              ),
              const SizedBox(height: 16),
              GestureDetector(
                onTap: () {
                  Navigator.of(context)
                      .push(MaterialPageRoute(builder: (BuildContext context) {
                    return SendMail(

                        user: user, ContainerDecoration: ContainerDecoration,
                              appBarText: '문의하기',
                        );
                  }));
                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text(
                      '문의하기',
                      style: ts,
                    ),
                    Text('forstudyhw2@gmail.com',
                        style: ts.copyWith(fontSize: 13, color: Colors.grey)),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Future _onPowerKey(context, ts) async {
    return await showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          backgroundColor: BRIGHT_COLOR,
          title: Text('알림', style: ts),
          content: Text('종료하시겠습니까?', style: ts),
          actions: [
            TextButton(
              onPressed: () {
                SystemChannels.platform.invokeListMethod('SystemNavigator.pop');
              },
              child: Text('예', style: ts),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: Text('아니요', style: ts),
            ),
          ],
        );
      },
    );
  }
}
