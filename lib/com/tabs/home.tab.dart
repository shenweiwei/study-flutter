import 'package:flutter/material.dart';
import 'package:study/com/core/widgets/bottom-nav-tabs.dart';
import 'package:study/com/core/widgets/top-app-bar.dart';
import 'package:study/data.dart';

class HomeTab extends StatefulWidget {
  HomeTab({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomeTabState createState() => new _HomeTabState();

  static create(){
    return new HomeTab();
  }
}

class _HomeTabState extends State<HomeTab> {
  int _counter = 0;

  void _incrementCounter() {
    setState(() {
      _counter++;
    });
  }

  @override
  Widget build(BuildContext context) {
    return new Scaffold(
        appBar: TopAppBar.create(title: 'Home'),
        body: new Center(
          child: new Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              new CounterDisplay(count: this._counter),
              new CounterIncrementor(onPressed: _incrementCounter)
            ],
          ),
        ),
        bottomNavigationBar: BottomNavTabs.create(HOME_TAB['index']));
  }
}

// count 显示层
class CounterDisplay extends StatelessWidget {
  CounterDisplay({this.count});

  final int count;

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: <Widget>[
        new Text(
          'You have pushed the button this many times:',
        ),
        new Text(
          '$count',
          style: Theme.of(context).textTheme.display1,
        )
      ],
    );
  }
}

// count 递增类
class CounterIncrementor extends StatelessWidget {
  CounterIncrementor({this.onPressed});

  final VoidCallback onPressed;

  @override
  Widget build(BuildContext context) {
    return new FloatingActionButton(
      onPressed: onPressed,
      tooltip: 'Increment',
      child: new Icon(Icons.add),
    );
  }
}