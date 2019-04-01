import 'dart:async';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:image_picker/image_picker.dart';
import 'package:study/com/core/http/http.dart';
import 'package:study/com/core/widgets/bottom-nav-tabs.dart';
import 'package:study/com/core/widgets/top-app-bar.dart';
import 'package:study/com/pages/camera/camera.page.dart';
import 'package:study/data.dart';
import 'package:study/env/env.dart';

class CameraTab extends StatefulWidget {
  @override
  _CameraTabState createState() => new _CameraTabState();

  static create() {
    return CameraTab();
  }
}

class _CameraTabState extends State<CameraTab> {
  File _image;
  FormDisplay formDisplay;

  _CameraTabState() {
    getImage();
  }

  Future getImage() async {
    var image = await ImagePicker.pickImage(source: ImageSource.camera);

    setState(() {
      _image = image;
    });
  }

  appBarAction() {
    Http http = new Http();
    String uri = ENV['baseUrl'].toString() + 'study/picture';
    DateTime now = new DateTime.now();
    String fileName =
        now.toString() + (ENV['androidInfo'] != null ? '_android' : '_ios');

    http.uploadFile(uri, this._image, fileName, data: {
      'suffixName': 'png',
      'describe': formDisplay.getValue(),
    }).then((result) {
      print(result);
    });
  }

  @override
  Widget build(BuildContext context) {
    formDisplay = new FormDisplay();

    return Scaffold(
        appBar: TopAppBar.create(title: 'Camera', actions: [
          AppBarAction.icon(
            onPressed: () {
              this.appBarAction();
            },
            iconData: Icons.send,
          )
        ]),
        body: Container(
            child: this._image == null
                ? Center(child: Text('No image selected'))
                : CameraPage(file: this._image, formWidget: formDisplay)),
        bottomNavigationBar: BottomNavTabs.create(CAMERA_TAB['index']));
  }
}
