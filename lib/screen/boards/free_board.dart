import 'package:flutter/material.dart';
import 'package:per_pro/component/add_post_screen.dart';
import 'package:per_pro/component/appbar.dart';
import 'package:per_pro/screen/login/login_screen.dart';
import '../../constant/color.dart';

class FreeBoard extends StatefulWidget {
  const FreeBoard({Key? key}) : super(key: key);

  @override
  State<FreeBoard> createState() => _FreeBoardState();
}

class _FreeBoardState extends State<FreeBoard> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: BRIGHT_COLOR,
      floatingActionButton: renderFloatingActionButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
      body: SingleChildScrollView(
        child: SafeArea(
          child: Column(
            children: [
              CustomAppBar(titleText: '자유게시판'),
              Column(
                children: [

                ],
              )
            ],
          ),
        ),
      ),
    );
  }

  FloatingActionButton renderFloatingActionButton() {
    return FloatingActionButton(
      onPressed: () {
        showModalBottomSheet(
          context: context,
          isDismissible: true,
          isScrollControlled: true,
          builder: (_) {
            return AddPostBottomSheet();
          },
        );
      },
      backgroundColor: PRIMARY_COLOR,
      child: Icon(
        Icons.add,
      ),
    );
  }
}
