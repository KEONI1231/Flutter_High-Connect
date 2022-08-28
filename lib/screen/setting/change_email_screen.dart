import 'package:flutter/material.dart';
import 'package:per_pro/constant/color.dart';
import 'package:per_pro/component/account_textfield.dart';

class changeEmail extends StatefulWidget {
  const changeEmail({Key? key}) : super(key: key);

  @override
  State<changeEmail> createState() => _changeEmailState();
}

class _changeEmailState extends State<changeEmail> {
  final TextEditingController _currentEmailController = TextEditingController();
  final TextEditingController _newEmailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(color: PRIMARY_COLOR);
    return Scaffold(
      backgroundColor: BRIGHT_COLOR,
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              AppBar(
                title: Text('이메일 변경'),
                backgroundColor: PRIMARY_COLOR,
                centerTitle: true,
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(24, 40, 24, 24),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('현재 이메일', style: ts),
                    const SizedBox(height: 8),
                    CustomTextField(
                      textInputType: TextInputType.visiblePassword,
                      Controller: _currentEmailController,
                      label: '현재 이메일',
                    ),
                    const SizedBox(height: 40),
                    Text('새 이메일', style: ts),
                    const SizedBox(height: 8),
                    CustomTextField(
                      textInputType: TextInputType.visiblePassword,
                      Controller: _newEmailController,
                      label: '새 이메일',
                    ),
                    const SizedBox(height: 8),
                    Text('계정 비밀번호', style: ts),
                    const SizedBox(height: 8),
                    CustomTextField(
                      textInputType: TextInputType.visiblePassword,
                      Controller: _newEmailController,
                      label: '계정 비밀번호',
                    ),
                    const SizedBox(height: 24),
                    Center(
                      child: ElevatedButton(
                        onPressed: () {},
                        child: Text('이메일 변경'),
                        style: ElevatedButton.styleFrom(
                            primary: PRIMARY_COLOR,
                            minimumSize: Size(150, 40),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(16),
                            )),
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
