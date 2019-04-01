import 'package:flutter/material.dart';

class NewsViewTopBar extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsViewTopBarState();
}

class _NewsViewTopBarState extends State<NewsViewTopBar> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 10),
        child: _NewsViewTopBarDisplay());
  }
}

class _NewsViewTopBarDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
          child: _NewsViewTopBarAvatarDisplay(),
        ),
        Expanded(
          child: _NewsViewTopBarAttentionDisplay(),
        )
      ],
    );
  }
}

class _NewsViewTopBarAvatarDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        Image(
          fit: BoxFit.fitWidth,
          image: NetworkImage(
              "http://b-ssl.duitang.com/uploads/item/201408/28/20140828015833_3xCLc.thumb.700_0.jpeg"),
          width: 30.0,
          height: 30.0,
        ),
        Text('蜡笔小新')
      ],
    );
  }
}

class _NewsViewTopBarAttentionDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.end,
      children: <Widget>[
        FlatButton.icon(
            icon: Icon(Icons.add), label: Text('关注'), onPressed: () => {}),
      ],
    );
  }
}
