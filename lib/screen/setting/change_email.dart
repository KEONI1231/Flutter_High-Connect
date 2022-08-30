import 'package:flutter/material.dart';
import 'package:per_pro/component/account_textfield.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/constant/color.dart';

class test extends StatelessWidget {
  final String id;
  final String pw;
  final String email;
  const test({
    required this.id,
    required this.pw,
    required this.email,
    Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(color: PRIMARY_COLOR, fontSize: 16);
    return Scaffold(
      body: Column(
        children : [
          CustomAppBar(titleText: '이메일 변경'),
          const SizedBox(height: 24),
          Container(
            width: MediaQuery.of(context).size.width / 1.1,
            height: MediaQuery.of(context).size.height / 5,
            decoration: BoxDecoration(
              color: Colors.white,
              borderRadius: BorderRadius.circular(16),
              boxShadow: [
                BoxShadow(
                    color: Colors.grey.withOpacity(0.5),
                    spreadRadius: 1,
                    blurRadius: 7,
                    offset: Offset(0, 10))
              ],
            ),
            child: Center(
              child: Text('현재 이메일 : $email',style : ts),
            )
          ),
          ChangeEmail(),
        ],
      )
    );
  }
}

class ChangeEmail extends StatefulWidget {

  const ChangeEmail({
  Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final TextEditingController _newEmailController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Column(
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
              child: Column(
                children: [
                  CustomTextField(
                    textInputType: TextInputType.emailAddress,
                    Controller: _newEmailController,
                    label: '새 이메일',
                  ),
                ],
              ),
            ),
          ],
        );

  }
}
