import 'package:flutter/material.dart';

class NewsViewToolbarStar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsViewToolbarStarState();
}

class _NewsViewToolbarStarState extends State<NewsViewToolbarStar> {
  bool flag = false;

  void onPressed() {
    setState(() {
      this.flag = this.flag ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _NewsViewToolbarStar(
        onPressed: onPressed, flag :this.flag);
  }
}

class _NewsViewToolbarStarDisplay extends StatelessWidget {
  final bool flag;

  _NewsViewToolbarStarDisplay({this.flag});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 200),
      firstChild: Icon(Icons.star_border, size: 25),
      secondChild: Icon(Icons.star, color: Colors.amber, size: 25),
      crossFadeState:
      !this.flag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class _NewsViewToolbarStar extends StatelessWidget {
  final VoidCallback onPressed;
  final bool flag;

  _NewsViewToolbarStar({this.onPressed, this.flag});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: _NewsViewToolbarStarDisplay(flag: this.flag),
        tooltip: 'not favorite',
        onPressed: onPressed);
  }
}
