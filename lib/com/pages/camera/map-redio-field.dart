import 'dart:async';

import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:geolocator/models/location_accuracy.dart';
import 'package:geolocator/models/position.dart';
import 'package:study/com/core/http/http.dart';
import 'package:study/data.dart';
import 'package:study/env/env.dart';

class MapRedioField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MapRedioFieldPage();
  }

  MapRedioField.create();
}

class MapRedioFieldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MapRedioFieldState();
}

class _MapRedioFieldState extends State<MapRedioFieldPage> {
  bool flag = false;
  List poiList = [];

  void onChanged(bool _flag) async {
    Position position =
        await Geolocator().getPosition(LocationAccuracy.bestForNavigation);

    await this.initPosition(position);

    setState(() {
      this.flag = _flag;
      if (!_flag) this.poiList = [];
    });
  }

  void onPressed(poi) {
    setState(() {
      this.poiList.remove(poi);
      if (this.poiList.length <= 0) this.flag = false;
    });
  }

  initPosition(Position position) async {
    double longitude = position.longitude + GPS['longitude'];
    double latitude = position.latitude + GPS['latitude'];
    Http http = new Http();
    String uri = ENV['mapServiceUrl'].toString() +
        '?longitude=${longitude}&latitude=${latitude}';

    await http.get(uri).then((result) {
      this.poiList = result.data['data']['poi_list'];
    });

    return this.poiList;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(children: <Widget>[
      new RedioFieldDisplay(
        callback: this.onChanged,
        flag: this.flag,
      ),
      new MapPositionDisplay(
        poiList: this.poiList,
        callback: this.onPressed,
      )
    ]);
  }
}

class RedioFieldDisplay extends StatelessWidget {
  final callback;
  final bool flag;

  RedioFieldDisplay({this.callback, this.flag});

  @override
  Widget build(BuildContext context) {
    return new Container(
        color: Colors.white70,
        child: new Row(children: [
          new Expanded(
            child: new Padding(
                padding: EdgeInsets.only(
                    left: 40.0, top: 0.0, bottom: 0.0, right: 0.0),
                child: new Text('添加至图片地图位置')),
          ),
          new Expanded(
              child: new Padding(
                  padding: EdgeInsets.only(
                      left: 0.0, top: 0.0, bottom: 0.0, right: 130.0),
                  child:
                      new Switch(value: this.flag, onChanged: this.callback)))
        ]));
  }
}

class MapPositionDisplay extends StatelessWidget {
  final List poiList;
  final callback;

  MapPositionDisplay({this.poiList, this.callback});

  List<Widget> render() {
    List<Widget> chipList = new List();

    for (var poi in poiList) {
      chipList.add(
        new Container(
            margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: new Chip(
              backgroundColor: Colors.grey.shade100,
              deleteIcon: new Icon(Icons.cancel),
              deleteIconColor: Colors.black54,
              onDeleted: () {
                callback(poi);
              },
              label: new Text(poi['name']),
            )),
      );
    }

    return chipList;
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: this.render());
  }
}
