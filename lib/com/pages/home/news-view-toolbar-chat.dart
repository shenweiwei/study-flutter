import 'package:flutter/material.dart';

class NewsViewToolbarChat extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsViewToolbarChatState();
}

class _NewsViewToolbarChatState extends State<NewsViewToolbarChat> {
  IconData iconData = Icons.chat_bubble_outline;

  void onPressed() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return _NewsViewToolbarChat(onPressed: onPressed, iconData: iconData);
  }
}

class _NewsViewToolbarChatDisplay extends StatelessWidget {
  final IconData iconData;

  _NewsViewToolbarChatDisplay({this.iconData});

  @override
  Widget build(BuildContext context) {
    return Icon(this.iconData, size: 25);
  }
}

class _NewsViewToolbarChat extends StatelessWidget {
  final VoidCallback onPressed;
  final IconData iconData;

  _NewsViewToolbarChat({this.onPressed, this.iconData});

  @override
  Widget build(BuildContext context) {
    return IconButton(
        icon: _NewsViewToolbarChatDisplay(iconData: this.iconData),
        tooltip: 'not favorite',
        onPressed: onPressed);
  }
}
