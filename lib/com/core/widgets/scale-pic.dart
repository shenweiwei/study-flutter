import 'dart:io';

import 'package:flutter/material.dart';

class ScalePicPage extends StatefulWidget {
  final File _file;
  final double width;
  final double height;
  final double scale;

  @override
  State<StatefulWidget> createState() =>
      new _ScalePicStatePage(_file, width, height, scale);

  ScalePicPage.file(this._file,{this.width, this.height, this.scale});
}

class _ScalePicStatePage extends State<ScalePicPage> {
  final File file;
  final double _width;
  final double _height;
  final double _scale;

  _ScalePicStatePage(this.file, this._width, this._height, this._scale);

  @override
  Widget build(BuildContext context) {
    Image image = new Image.file(file, scale: this._scale);

    return new Container(
      child: image,
      width: this._width,
      height: this._height,
      padding: const EdgeInsets.only(
          left: 0.0, top: 20.0, right: 0.0, bottom: 20.0),
    );
  }
}
