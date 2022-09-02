import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:per_pro/component/account_textfield.dart';
import 'package:per_pro/component/alert_dialog.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/constant/color.dart';

import '../../component/custom_button.dart';

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
      body: SingleChildScrollView(
        child: Column(
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
            ChangeEmail(id : id,email : email),
          ],
        ),
      )
    );
  }
}

class ChangeEmail extends StatefulWidget {
  final String email;
  final String id;
  const ChangeEmail({
    required this.id,
    required this.email,
  Key? key}) : super(key: key);

  @override
  State<ChangeEmail> createState() => _ChangeEmailState();
}

class _ChangeEmailState extends State<ChangeEmail> {
  final TextEditingController _newEmailController = TextEditingController();
  final GlobalKey<FormState> formKey = GlobalKey();
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(24, 40, 24, 40),
          child: Form(
            key: formKey,
            child: Column(
              children: [
                CustomTextField(
                  textInputType: TextInputType.emailAddress,
                  Controller: _newEmailController,
                  label: '새 이메일',
                ),
                CustomButton(text: '변경', istext: false, onPressed: onemailChangeBtn)
              ],
            ),
          ),
        ),
      ],
    );
  }
  void onemailChangeBtn() async{
    FirebaseFirestore firestore;
    if (formKey.currentState == null) {
      return;
    }
    if (formKey.currentState!.validate()) {

      try {
        print(widget.id);
        await FirebaseFirestore.instance.
        collection('users')
            .doc(widget.id)
            .update({'email' : _newEmailController.text});
        Navigator.pop(context);
        DialogShow(context, '이메일 변경을 완료하였습니다.');
      }catch(e) {
        Navigator.pop(context);
        DialogShow(context, '이메일 변경을 실패하였습니다.');
      }
    }


  }

}
