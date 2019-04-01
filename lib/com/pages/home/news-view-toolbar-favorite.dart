import 'package:flutter/material.dart';

class NewsViewToolbarFavorite extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsViewToolbarFavoriteState();
}

class _NewsViewToolbarFavoriteState extends State<NewsViewToolbarFavorite> {
  bool flag = false;

  void onPressed() {
    setState(() {
      this.flag = this.flag ? false : true;
    });
  }

  @override
  Widget build(BuildContext context) {
    return _NewsViewToolbarFavorite(
      onPressed: onPressed,
      flag: this.flag,
    );
  }
}

class _NewsViewToolbarFavoriteDisplay extends StatelessWidget {
  final bool flag;

  _NewsViewToolbarFavoriteDisplay({this.flag});

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
      duration: Duration(milliseconds: 200),
      firstChild: Icon(Icons.favorite_border, size: 25),
      secondChild: Icon(Icons.favorite, color: Colors.red, size: 25),
      crossFadeState:
          !this.flag ? CrossFadeState.showFirst : CrossFadeState.showSecond,
    );
  }
}

class _NewsViewToolbarFavorite extends StatelessWidget {
  final VoidCallback onPressed;
  final bool flag;

  _NewsViewToolbarFavorite({this.onPressed, this.flag});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: _NewsViewToolbarFavoriteDisplay(flag: this.flag),
        tooltip: 'not favorite',
        onPressed: onPressed);
  }
}
