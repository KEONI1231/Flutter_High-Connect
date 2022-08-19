import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  final String? passwordChecker;
  final TextEditingController Controller;
  final TextInputType textInputType;
  const CustomTextField({
    this.passwordChecker,
    required this.textInputType,
    required this.Controller,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _decoration = InputDecoration(
      //text 필드 데코레이션 정의 변수.
      labelText: label,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(
          Radius.circular(8.0),
        ),
      ),
    );
    return TextFormField(
      controller: Controller,
      validator: (String? val) {
        //null이 리턴된다면 에러가 없는 상태.
        if (val == null || val.isEmpty) {
          return '해당 필드는 필수항복입니다.';
        }
        if (textInputType == TextInputType.emailAddress) {
          bool emailValid = RegExp(
                  r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
              .hasMatch(val);
          if (emailValid == false) {
            return '잘못된 이메일 형식입니다.';
          } else {
            return null;
          }
        }
        if (textInputType == TextInputType.visiblePassword) {
          if (Controller.text != passwordChecker) {
            return '비밀번호가 일치하지 않습니다.';
          }
        }
        if (textInputType == TextInputType.phone) {
          bool phoneNumberValid =
              RegExp(r'^010-?([0-9]{4})-?([0-9]{4})$').hasMatch(val);
          if (phoneNumberValid == false) {
            return '전화번호 형식이 잘못되었습니다';
          }
        }
        return null;
      },
      obscureText:
          textInputType == TextInputType.visiblePassword ? true : false,
      decoration: _decoration,
      keyboardType: textInputType,
    );
  }
}
