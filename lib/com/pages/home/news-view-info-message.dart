import 'package:flutter/material.dart';

class NewsViewInfoMessage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsViewInfoMessageState();
}

class _NewsViewInfoMessageState extends State<NewsViewInfoMessage> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: _NewsViewInfoMessageDisplay());
  }
}
class _NewsViewInfoMessageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text('本游记的照片及文字均为实景拍摄和编写。内附多条推荐路线，网红取景地。'
          '内附酒吧及美食攻略，交通信息，实用信息等。'
          '游记中博物馆的部分比较长。'
          '孤独感如此普遍，以至于你并不孤独。一起去旅行吧……'),
    );
  }
}