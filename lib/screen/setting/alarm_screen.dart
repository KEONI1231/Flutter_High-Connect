import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class alarmscreen extends StatelessWidget {
  const alarmscreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
          body: Container(
            child: Row(
              children: [
                IconButton(
                    iconSize: 40.0,
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.lightBlue.shade50,
                              height: 500.0,
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.lightbulb,
                      color: Colors.yellow,
                    )),
                Text(
                  '알림',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
                Text('    '),
                IconButton(
                    iconSize: 40.0,
                    onPressed: () {
                      showCupertinoDialog(
                        context: context,
                        barrierDismissible: true,
                        builder: (BuildContext context) {
                          return Align(
                            alignment: Alignment.bottomCenter,
                            child: Container(
                              color: Colors.lightBlue.shade50,
                              height: 500.0,
                            ),
                          );
                        },
                      );
                    },
                    icon: Icon(
                      Icons.messenger,
                      color: Colors.red,
                    )),
                Text(
                  '쪽지함',
                  style: TextStyle(fontWeight: FontWeight.w900, fontSize: 30),
                ),
                SizedBox(
                  height: 15,
                ),
              ],
            ),
          ),
        ));
  }
}