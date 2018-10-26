import 'dart:async';

import 'package:flutter/material.dart';
import 'package:study/com/tabs/home.tab.dart';
import 'package:study/data.dart';
import 'package:study/env/env-dev.dart';
import 'package:study/env/env-prod.dart';
import 'package:study/env/env-qa.dart';
import 'package:study/env/env.dart';
import 'package:device_info/device_info.dart';

Future<Null> main() async {
  initEnv();

  runApp(new MyApp());
}

void initEnv() async {
  String env = ENV['env'];
  switch (env) {
    case 'dev':
      ENV = ENV_DEV;
      break;
    case 'qa':
      ENV = ENV_QA;
      break;
    default:
      ENV = ENV_PROD;
  }

  //初始化设备信息
  DeviceInfoPlugin deviceInfo = new DeviceInfoPlugin();
  try {
    ENV['androidInfo'] = await deviceInfo.androidInfo;
    ENV['iosInfo'] = await deviceInfo.iosInfo;
  } catch (e) {}
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return new MaterialApp(
        title: 'Flutter Demo',
        theme: new ThemeData(
          // This is the theme of your application.
          //
          // Try running your application with "flutter run". You'll see the
          // application has a blue toolbar. Then, without quitting the app, try
          // changing the primarySwatch below to Colors.green and then invoke
          // "hot reload" (press "r" in the console where you ran "flutter run",
          // or press Run > Flutter Hot Reload in IntelliJ). Notice that the
          // counter didn't reset back to zero; the application is not restarted.
          primarySwatch: Colors.yellow,
        ),
        home: new HomeTab(title: 'Flutter Demo Home tab'),
        routes: <String, WidgetBuilder>{
          '/home': (BuildContext context) => HOME_TAB['tab'],
          '/photo': (BuildContext context) => PHOTO_TAB['tab'],
          '/camera': (BuildContext context) => CAMERA_TAB['tab'],
          '/message': (BuildContext context) => MESSAGE_TAB['tab'],
          '/account': (BuildContext context) => ACCOUNT_TAB['tab'],
        });
  }
}
