import 'package:flutter/material.dart';

import 'package:geolocator/geolocator.dart';
import 'package:study/com/core/http/http.dart';
import 'package:study/data.dart';
import 'package:study/env/env.dart';

class MapRadioField extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return new MapRadioFieldPage();
  }

  MapRadioField.create();
}

class MapRadioFieldPage extends StatefulWidget {
  @override
  State<StatefulWidget> createState() => new _MapRadioFieldState();
}

class _MapRadioFieldState extends State<MapRadioFieldPage> {
  bool flag = false;
  List poiList = [];

  void onChanged(bool _flag) async {

    Position position = await Geolocator().getLastKnownPosition(
        desiredAccuracy: LocationAccuracy.bestForNavigation);
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
        '?longitude=$longitude&latitude=$latitude';

    await http.get(uri).then((result) {
      this.poiList = result.data['data']['poi_list'];
    });

    return this.poiList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(children: <Widget>[
      RadioFieldDisplay(
        callback: this.onChanged,
        flag: this.flag,
      ),
      MapPositionDisplay(
        poiList: this.poiList,
        callback: this.onPressed,
      )
    ]);
  }
}

class RadioFieldDisplay extends StatelessWidget {
  final callback;
  final bool flag;

  RadioFieldDisplay({this.callback, this.flag});

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white70,
        child: Row(children: [
          Expanded(
            child: Padding(
                padding: EdgeInsets.only(
                    left: 40.0, top: 0.0, bottom: 0.0, right: 0.0),
                child: Text('添加至图片地图位置')),
          ),
          Expanded(
              child: Padding(
                  padding: EdgeInsets.only(
                      left: 0.0, top: 0.0, bottom: 0.0, right: 130.0),
                  child:
                      Switch(value: this.flag, onChanged: this.callback)))
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
        Container(
            margin: EdgeInsets.only(top: 2.0, bottom: 2.0),
            child: Chip(
              backgroundColor: Colors.grey.shade100,
              deleteIcon: Icon(Icons.cancel),
              deleteIconColor: Colors.black54,
              onDeleted: () {
                callback(poi);
              },
              label: Text(poi['name']),
            )),
      );
    }

    return chipList;
  }

  @override
  Widget build(BuildContext context) {
    return Column(
        crossAxisAlignment: CrossAxisAlignment.start, children: this.render());
  }
}
