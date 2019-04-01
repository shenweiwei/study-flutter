import 'package:flutter/material.dart';
import 'package:study/com/pages/home/news-view-info-message.dart';
import 'package:study/com/pages/home/news-view-info.dart';
import 'package:study/com/pages/home/news-view-toolbar-chat.dart';
import 'dart:ui';

import 'package:study/com/pages/home/news-view-toolbar-favorite.dart';
import 'package:study/com/pages/home/news-view-toolbar-launch.dart';
import 'package:study/com/pages/home/news-view-toolbar-star.dart';
import 'package:study/com/pages/home/news-view-topbar.dart';

class NewsView extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsViewStatePage();
}

class _NewsViewStatePage extends State<NewsView> {
  @override
  Widget build(BuildContext context) {
    return _NewsViewDisplay();
  }
}

class _NewsViewDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Container(
        color: Colors.white,
        height: 480,
        child: Column(
          children: <Widget>[
            _NewsViewTopBarDisplay(),
            _NewsViewImageDisplay(),
            _NewsViewInfoDisplay(),
            _NewsViewInfoMessageDisplay(),
            _NewsViewToolbarDisplay(),
            _NewsViewImageDividerDisplay(),
          ],
        ));
  }
}
class _NewsViewTopBarDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 10.0),
        child: NewsViewTopBar());
  }
}

class _NewsViewImageDividerDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 15.0, right: 15.0), child: Divider());
  }
}

class _NewsViewImageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
          margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
          child: Image.network(
            "https://timgsa.baidu.com/timg?image&quality=80&size=b9999_10000&sec=1553492852454&di=63e301b86da4acee9dd74f6e4751b993&imgtype=0&src=http%3A%2F%2Fpic2.ooopic.com%2F11%2F44%2F96%2F87b3OOOPICd4.jpg",
          )),
    );
  }
}

class _NewsViewInfoDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0), child: NewsViewInfo());
  }
}

class _NewsViewInfoMessageDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(top: 5.0, bottom: 5.0),
        child: NewsViewInfoMessage());
  }
}

class _NewsViewToolbarDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 10, right: 10),
      child: Row(
        children: <Widget>[
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[NewsViewToolbarLaunch()],
          )),
          Expanded(
              child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: <Widget>[
              NewsViewToolbarFavorite(),
              NewsViewToolbarStar(),
              NewsViewToolbarChat()
            ],
          ))
        ],
      ),
    );
  }
}
