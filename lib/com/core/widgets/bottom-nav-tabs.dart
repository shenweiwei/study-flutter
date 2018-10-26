import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';
import 'package:study/data.dart';

class BottomNavTabs extends StatefulWidget {
  final int _pageIndex;
  BottomNavTabs(this._pageIndex);

  @override
  _BottomNavTabsState createState() => new _BottomNavTabsState(this._pageIndex);

  static create(pageIndex) {
    return new BottomNavTabs(pageIndex);
  }
}

class _BottomNavTabsState extends State<BottomNavTabs> {
  int _currentPageIndex = 0;
  final int _pageIndex;

  _BottomNavTabsState(this._pageIndex) {
    if (this._pageIndex > 0) this._currentPageIndex = _pageIndex;
  }

  @override
  Widget build(BuildContext context) {
    return new BottomNavTabsDisplay(
        onTap: onTap, currentPageIndex: _currentPageIndex);
  }

  void onTap(int index) {
    setState(() {
      if (_currentPageIndex != index) _currentPageIndex = index;

      for (var tab in tabs) {
        if (_currentPageIndex == tab['index']) {
          Navigator.push(
              context,
              new PageRouteBuilder(
                opaque: false,
                pageBuilder: (BuildContext context, _, __) {
                  return tab['entity'];
                },
                transitionsBuilder:
                    (___, Animation<double> animation, ____, Widget child) {
                  return new FadeTransition(
                    opacity: animation,
                    child: child,
                  );
                }
              ));
        }
      }
    });
  }
}

class BottomNavTabsDisplay extends StatelessWidget {
  final Function onTap;
  final int currentPageIndex;
  BottomNavTabsDisplay({@required this.onTap, @required this.currentPageIndex});

  @override
  Widget build(BuildContext context) {
    return new BottomNavigationBar(
        items: getBottomNavBarItems(),
        onTap: onTap,
        currentIndex: currentPageIndex);
  }

// 初始化下面的bottom菜单
  List<BottomNavigationBarItem> getBottomNavBarItems() {
    List<BottomNavigationBarItem> items = [];

    for (var tab in tabs) {
      BottomNavigationBarItem item = new BottomNavigationBarItem(
          icon: new Icon(tab['icon'], color: BOTTOM_NAV_BAR['ICON_COLOR']),
          title: new Text(tab['title'],
              style: new TextStyle(color: BOTTOM_NAV_BAR['TEXT_COLOR'])),
          backgroundColor: BOTTOM_NAV_BAR['BACKGROUND_COLOR']);
      items.add(item);
    }

    return items;
  }
}
