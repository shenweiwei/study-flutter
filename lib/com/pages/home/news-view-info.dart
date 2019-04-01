import 'package:flutter/material.dart';

class NewsViewInfo extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => _NewsViewInfoState();
}

class _NewsViewInfoState extends State<NewsViewInfo> {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: EdgeInsets.only(left: 20, right: 20),
        child: _NewsViewInfoDisplay());
  }
}

class _NewsViewInfoDisplay extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Row(
      children: <Widget>[
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[Icon(Icons.location_on), Text('上海')],
        )),
        Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.end,
          children: <Widget>[Icon(Icons.straighten), Text('500m')],
        ))
      ],
    );
  }
}


