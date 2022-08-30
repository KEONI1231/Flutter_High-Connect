import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/screen/setting/certified_screen.dart';
import 'package:per_pro/screen/login/signup_screen.dart';
import 'package:per_pro/screen/setting/change_email_beforlogin.dart';
import '../constant/color.dart';
import 'setting/change_pw_screen.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
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
              ProfileCard(),
              const SizedBox(height: 32),
              Text('개인/계정 설정', style: ts),
              const SizedBox(height: 16),
              PersonalCardSetting(),
              const SizedBox(height: 32),
              Text('앱 설정', style: ts),
              const SizedBox(height: 16),
              AppSetting(),
              const SizedBox(height: 24),
              Text('기타', style: ts),
              const SizedBox(height: 16),
              etcSetting(),
              const SizedBox(height: 40),
            ],
          ),
        ),
      ),
    );
  }
}

class ProfileCard extends StatelessWidget {
  const ProfileCard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontWeight: FontWeight.w700, color: PRIMARY_COLOR, fontSize: 12);
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 3,
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
        padding: const EdgeInsets.fromLTRB(0, 16, 0, 0),
        child: Column(
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Container(
                  width: 100,
                  height: 100,
                  decoration: BoxDecoration(
                      color: PRIMARY_COLOR,
                      //border: Border.all(width: 3, color: PRIMARY_COLOR),
                      borderRadius: BorderRadius.circular(32)),
                ),
                Column(
                  children: [
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
                          return certified_screen();
                        }));
                      },
                      child: Text(
                        '학교 인증하기',
                        style: ts.copyWith(fontSize: 12),
                      ),
                    ),
                    Text(
                      '김건휘',
                      style: ts,
                    ),
                    Text(
                      '디지몬 미쿠쨩 고등학교',
                      style: ts.copyWith(fontSize: 10),
                    )
                  ],
                )
              ],
            ),
            SizedBox(height: 24),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                ElevatedButton(
                  onPressed: () {},
                  child: Text(''),
                  style: ElevatedButton.styleFrom(
                      primary: GREY_COLOR,
                      minimumSize: Size(30, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(''),
                  style: ElevatedButton.styleFrom(
                      primary: GREY_COLOR,
                      minimumSize: Size(30, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
                ElevatedButton(
                  onPressed: () {},
                  child: Text(''),
                  style: ElevatedButton.styleFrom(
                      primary: GREY_COLOR,
                      minimumSize: Size(30, 30),
                      shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(32))),
                ),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Text(
                  '내가 쓴 내용',
                  style: ts,
                ),
                Text(
                  '내가 쓴 댓글',
                  style: ts,
                ),
                Text(
                  '모은 스크랩 ',
                  style: ts,
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}

class PersonalCardSetting extends StatelessWidget {
  const PersonalCardSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontWeight: FontWeight.w900, color: PRIMARY_COLOR, fontSize: 14);
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 3.4,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return certified_screen();
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
                  return ChangePassword();
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
                  return ChangeEmailLogin();
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
                  return signUp();
                }));
              },
              child: Text(
                '닉네임 설정',
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
                '프로필 사진 변경',
                style: ts,
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class AppSetting extends StatelessWidget {
  const AppSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontWeight: FontWeight.w900, color: PRIMARY_COLOR, fontSize: 14);
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 5,
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
        padding: const EdgeInsets.all(8.0),
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
    );
  }
}

class etcSetting extends StatelessWidget {
  const etcSetting({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(
        fontWeight: FontWeight.w900, color: PRIMARY_COLOR, fontSize: 14);
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 5,
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
        padding: const EdgeInsets.all(8.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            GestureDetector(
              onTap: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (BuildContext context) {
                  return certified_screen();
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
                  return certified_screen();
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
    );
  }

  Future _onPowerKey(context, ts) async {
    return await showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            backgroundColor: BRIGHT_COLOR,
            title: Text('알림',style: ts),
            content: Text('종료하시겠습니까?',style: ts),
            actions: [
              TextButton(
                onPressed: () {
                  SystemChannels.platform
                      .invokeListMethod('SystemNavigator.pop');
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
