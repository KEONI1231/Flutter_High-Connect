import 'package:flutter/material.dart';

import '../constant/color.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            AppBar(
              title: Text('설정'),
              backgroundColor: PRIMARY_COLOR,
              centerTitle: true,
            ),
            SizedBox(height: 16),
            const Text('프로필수정'),
            const SizedBox(height: 16),
            Column(
              children: [
                Row(),
                Row(),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
