import 'dart:io';

import 'package:flutter/material.dart';
import 'package:study/com/core/widgets/scale-pic.dart';
import 'package:study/com/pages/camera/map-radio-field.dart';
import 'package:study/com/pages/camera/share-plugin.dart';

class CameraPage extends StatefulWidget {
  final File file;
  final Widget formWidget;

  CameraPage({Key key, this.file, this.formWidget}) : super(key: key);

  @override
  State<StatefulWidget> createState() =>
      new _CameraStatePage(this.file, this.formWidget);
}

class _CameraStatePage extends State<CameraPage> {
  File file;
  Widget formWidget;
  double width = 200.0;
  double height = 200.0;

  _CameraStatePage(this.file, this.formWidget);

  @override
  Widget build(BuildContext context) {
    return Container(
        color: Colors.white30,
        child: Scrollbar(
            child: SingleChildScrollView(
                child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: [
            Container(
                padding: EdgeInsets.only(right: 20.0),
                color: Colors.white70,
                child: Row(children: [
                  Expanded(
                      child: new ScalePicPage.file(
                    file,
                    scale: 1.0,
                    width: this.width,
                    height: this.height,
                  )),
                  Expanded(child: this.formWidget)
                ])),
            Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Divider()),
            MapRadioField.create(),
            Container(
                margin: EdgeInsets.only(left: 20.0, right: 20.0),
                child: Divider()),
            SharePlugin.create()
          ],
        ))));
  }
}

class FormDisplay extends StatefulWidget {
  final TextEditingController textEditingController =
      new TextEditingController();

  FormDisplay();

  @override
  State<StatefulWidget> createState() =>
      new _FormDisplayState(textEditingController: textEditingController);

  getValue() {
    return this.textEditingController.text;
  }
}

class _FormDisplayState extends State {
  String describe;
  TextEditingController textEditingController;

  _FormDisplayState({this.describe, this.textEditingController});

  @override
  Widget build(BuildContext context) {
    return TextField(
        controller: textEditingController,
        maxLength: 20,
        decoration: new InputDecoration(hintText: '请输入需要描述的文字'),
        keyboardType: TextInputType.multiline);
  }
}
