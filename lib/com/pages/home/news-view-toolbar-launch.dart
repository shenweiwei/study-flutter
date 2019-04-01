import 'package:flutter/material.dart';

class NewsViewToolbarLaunch extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsViewToolbarLaunchState();
}

class _NewsViewToolbarLaunchState extends State<NewsViewToolbarLaunch> {
  IconData iconData = Icons.launch;

  void onPressed() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _NewsViewToolbarLaunch(onPressed: onPressed, iconData: iconData);
  }
}

class _NewsViewToolbarLaunchDisplay extends StatelessWidget {
  final IconData iconData;

  _NewsViewToolbarLaunchDisplay({this.iconData});

  @override
  Widget build(BuildContext context) {
    return Icon(this.iconData, size: 25);
  }
}

class _NewsViewToolbarLaunch extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  _NewsViewToolbarLaunch({this.onPressed, this.iconData});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: _NewsViewToolbarLaunchDisplay(iconData: this.iconData),
        tooltip: 'not favorite',
        onPressed: onPressed);
  }
}
