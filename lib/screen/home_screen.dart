import 'package:flutter/material.dart';
import 'package:per_pro/constant/color.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: DefaultTabController(
        length: 5,
        child: Scaffold(
          backgroundColor: BRIGHT_COLOR,
          appBar: AppBar(
            title: Text('Navi'),
            centerTitle: true,
            backgroundColor: PRIMARY_COLOR,
            actions: [IconButton(onPressed: () {}, icon: Icon(Icons.settings))],
          ),
          body: TabBarView(
            children: [
              Center(
                child: Text("Home"),
              ),
              Center(
                child: Text("Word Cloud"),
              ),
              Center(
                child: Text("Borad"),
              ),
              Center(
                child: Text("settings"),
              ),
              Center(
                child: Text("Letter/Notification"),
              ),
            ],
          ),
          extendBodyBehindAppBar: true, // add this line

          bottomNavigationBar: Container(
            color: BRIGHT_COLOR, //색상
            child: Container(
              height: 70,
              padding: EdgeInsets.only(bottom: 10, top: 5),
              child: const TabBar(
                //tab 하단 indicator size -> .label = label의 길이
                //tab 하단 indicator size -> .tab = tab의 길이
                indicatorSize: TabBarIndicatorSize.label,
                //tab 하단 indicator color
                indicatorColor: PRIMARY_COLOR,
                //tab 하단 indicator weight
                indicatorWeight: 2,
                //label color
                labelColor: PRIMARY_COLOR,
                //unselected label color
                unselectedLabelColor: Colors.black38,
                labelStyle: TextStyle(
                  fontSize: 13,
                ),
                tabs: [
                  Tab(
                    icon: Icon(Icons.home_outlined),
                  ),
                  Tab(
                    icon: Icon(Icons.pie_chart),
                  ),
                  Tab(
                    icon: Icon(Icons.format_list_bulleted),
                  ),
                  Tab(icon: Icon(Icons.table_chart)),
                  Tab(
                    icon: Icon(Icons.message),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
