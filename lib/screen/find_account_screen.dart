import 'package:flutter/material.dart';
import 'package:per_pro/constant/color.dart';

class findaccount extends StatefulWidget {
  const findaccount({Key? key}) : super(key: key);

  @override
  State<findaccount> createState() => _findaccountState();
}

class _findaccountState extends State<findaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BRIGHT_COLOR,
        body: Center(
      child: Text('비밀번호 찾기'),
    ));
  }
}
