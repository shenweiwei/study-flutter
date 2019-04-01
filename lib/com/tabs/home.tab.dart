import 'package:flutter/material.dart';
import 'package:study/com/core/widgets/bottom-nav-tabs.dart';
import 'package:study/com/core/widgets/top-app-bar.dart';
import 'package:study/com/pages/home/news-view.dart';
import 'package:study/data.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeTabState createState() => new _HomeTabState();

  static create() {
    return new HomeTab();
  }
}

class _HomeTabState extends State<HomeTab> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: TopAppBar.create(title: 'Home'),
        body: Container(
//          padding: EdgeInsets.only(left: 15, right: 15),
          child: ListView(
            children: getNewsViewList(),
          ),
        ),
        bottomNavigationBar: BottomNavTabs.create(HOME_TAB['index']));
  }

  List<Widget> getNewsViewList() {
    List<Widget> result = [NewsView(), NewsView(), NewsView()];
    return result;
  }
}
