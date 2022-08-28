import 'package:flutter/material.dart';
import 'package:per_pro/component/account_textfield.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/constant/color.dart';

class ChangePassword extends StatefulWidget {
  const ChangePassword({Key? key}) : super(key: key);

  @override
  State<ChangePassword> createState() => _ChangePasswordState();
}

class _ChangePasswordState extends State<ChangePassword> {
  final TextEditingController _currentPwController = TextEditingController();
  final TextEditingController _newPwController = TextEditingController();
  final TextEditingController _renewPwController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(color: PRIMARY_COLOR);
    return Scaffold(
      backgroundColor: BRIGHT_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(titleText: '비밀번호 찾기'),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('현재 비밀번호',style: ts),
                    const SizedBox(height: 8),
                    CustomTextField(
                      textInputType: TextInputType.visiblePassword,
                      Controller: _currentPwController,
                      label: '현재 비밀번호',
                    ),
                    const SizedBox(height: 40),
                    Text('새 비밀번호',style: ts),
                    const SizedBox(height: 8),
                    CustomTextField(
                      textInputType: TextInputType.visiblePassword,
                      Controller: _newPwController,
                      label: '새 비밀번호',
                    ),
                    const SizedBox(height: 8),
                    CustomTextField(
                      textInputType: TextInputType.visiblePassword,
                      Controller: _renewPwController,
                      label: '새 비밀번호 확인',
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('비밀번호 변경'),
                        style: ElevatedButton.styleFrom(
                          primary: PRIMARY_COLOR,
                          minimumSize: Size(150, 40),
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(16),
                          )
                        ),
                      ),
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
}
