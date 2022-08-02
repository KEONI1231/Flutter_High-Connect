import 'package:flutter/material.dart';

class certified_screen extends StatefulWidget {
  const certified_screen({Key? key}) : super(key: key);

  @override
  State<certified_screen> createState() => _certified_screenState();
}

class _certified_screenState extends State<certified_screen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('학교인증'),
      )
    );
  }
}
