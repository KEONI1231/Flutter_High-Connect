import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

import '../constant/color.dart';

class CustomAddReplTextField extends StatelessWidget {
  final String label;
  final TextEditingController Controller;
  const CustomAddReplTextField({
    required this.Controller,
    required this.label,
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final _decoration = InputDecoration(
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
          if (val == null || val.isEmpty) {
            return '해당 필드는 필수항복입니다.';
          }

          return null;
        },
        decoration: _decoration,
      );
  }
}
