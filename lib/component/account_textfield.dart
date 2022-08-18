import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  final String label;
  const CustomTextField({
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _decoration = InputDecoration(
      //text 필드 데코레이션 정의 변수.
      labelText: label,
      border: const OutlineInputBorder(
        borderRadius: BorderRadius.all(Radius.circular(4.0)),
      ),
    );
    return TextFormField(
      validator: (String? val) {
        if (val == null || val.isEmpty) {
          return '값을 입력해주세요.';
        } else {
          return null;
        }
      },
      decoration: _decoration,
      keyboardType: TextInputType.emailAddress,
    );
  }
}
