import 'package:flutter/material.dart';

class findaccount extends StatefulWidget {
  const findaccount({Key? key}) : super(key: key);

  @override
  State<findaccount> createState() => _findaccountState();
}

class _findaccountState extends State<findaccount> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('비밀번호 찾기'),
      )
    );
  }
}
