import 'package:flutter/material.dart';

class SharePlugin extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new SharePluginPage();
  }

  SharePlugin.create();
}

class SharePluginPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new SharePluginPageState();
}

class SharePluginPageState extends State<SharePluginPage> {
  @override
  Widget build(BuildContext context) {
    return new Container(
      child: new Column(children: <Widget>[
        new Container(
            decoration: new BoxDecoration(
                border: new Border(
                    bottom: Divider.createBorderSide(context, width: 2.0))),
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 15.0),
            margin: EdgeInsets.only(left: 20.0, right: 20.0),
            child: new Text('分享',
                style: new TextStyle(
                    fontWeight: FontWeight.bold, fontSize: 18.0))),
        new Container(
            child: new Row(children: <Widget>[
          new Expanded(
              child: ShareIcon.create(
                  title: '微信', position: 'left', icon: Icons.add_box)),
          new Expanded(
              child: ShareIcon.create(
                  title: 'QQ', position: 'right', icon: Icons.add_box))
        ])),
        new Container(
            child: new Row(
          children: <Widget>[
            new Expanded(
                child: ShareIcon.create(
                    title: '腾讯微博', position: 'left', icon: Icons.add_box)),
            new Expanded(
                child: ShareIcon.create(
                    title: '新浪微博', position: 'right', icon: Icons.add_box))
          ],
        )),
      ]),
    );
  }
}

class ShareIcon extends StatelessWidget {
  final String title;
  final String position;
  final IconData icon;

  ShareIcon.create({this.title, this.position, this.icon});

  @override
  Widget build(BuildContext context) {
    Border border = this.position == 'left'
        ? new Border(
            right: Divider.createBorderSide(context, width: 0.5),
            bottom: Divider.createBorderSide(context, width: 1.0))
        : new Border(
            left: Divider.createBorderSide(context, width: 0.5),
            bottom: Divider.createBorderSide(context, width: 1.0));

    EdgeInsets marginEdgeInsets = this.position == 'left'
        ? EdgeInsets.only(left: 20.0)
        : EdgeInsets.only(right: 20.0);

    return new Container(
      decoration: new BoxDecoration(border: border),
      padding: EdgeInsets.only(left: 20.0, top: 20.0, bottom: 20.0),
      margin: marginEdgeInsets,
      child: new Row(
        children: <Widget>[new Icon(this.icon), new Text(this.title)],
      ),
    );
  }
}
