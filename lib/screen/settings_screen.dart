import 'package:flutter/material.dart';

import '../constant/color.dart';

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
              AppBar(
                title: Text('설정'),
                backgroundColor: PRIMARY_COLOR,
                centerTitle: true,
              ),
              const SizedBox(height: 24),
              Text(
                '프로필수정',
                style: ts,
              ),
              const SizedBox(height: 16),
              ProfileCard(),
              const SizedBox(height: 32),
              Text('개인 설정', style: ts),
              const SizedBox(height: 16),
              Container(
                width: MediaQuery.of(context).size.width / 1.1,
                height: MediaQuery.of(context).size.height / 3,
                decoration: BoxDecoration(
                  color: BRIGHT_COLOR,
                  border: Border.all(width: 2, color: PRIMARY_COLOR),
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                        color: Colors.grey.withOpacity(0.5),
                        spreadRadius: 1,
                        blurRadius: 7,
                        offset: Offset(0, 10))
                  ],
                ),
              )
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
    final ts = TextStyle(fontWeight: FontWeight.w700, color: PRIMARY_COLOR);
    return Container(
      width: MediaQuery.of(context).size.width / 1.1,
      height: MediaQuery.of(context).size.height / 3,
      decoration: BoxDecoration(
          color: BRIGHT_COLOR,
          border: Border.all(width: 2, color: PRIMARY_COLOR),
          borderRadius: BorderRadius.circular(16),
          boxShadow: [
            BoxShadow(
                color: Colors.grey.withOpacity(0.5),
                spreadRadius: 1,
                blurRadius: 7,
                offset: Offset(0, 10))
          ]),
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
                      border: Border.all(width: 3, color: PRIMARY_COLOR),
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
                      onPressed: () {},
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
