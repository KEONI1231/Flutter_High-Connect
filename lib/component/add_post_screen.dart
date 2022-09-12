import 'package:flutter/material.dart';
import 'package:per_pro/component/custom_AddPost_TextFiled.dart';
import 'package:per_pro/component/send_mail_custom_textfield.dart';
import 'package:per_pro/constant/color.dart';

class AddPostBottomSheet extends StatelessWidget {
  const AddPostBottomSheet({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final ts = TextStyle(color: PRIMARY_COLOR, fontSize: 24);
    final TextEditingController titleTextController = TextEditingController();
    final TextEditingController contentTextController = TextEditingController();
    final bottomInset = MediaQuery.of(context).viewInsets.bottom;

    return Container(
      color: BRIGHT_COLOR,
      height: MediaQuery.of(context).size.height / 2 + bottomInset,
      child: Padding(
        padding: EdgeInsets.only(bottom: bottomInset),
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.all(32.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text('제목', style: ts),
                const SizedBox(height: 16),
                CustomAddPostTextField(
                    controller: titleTextController, isPostTtile: true),
                const SizedBox(height: 16),
                Text('내용', style: ts),
                const SizedBox(height: 16),
                CustomAddPostTextField(
                    controller: contentTextController, isPostTtile: false),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
