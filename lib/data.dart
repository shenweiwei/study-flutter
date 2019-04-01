import 'package:flutter/material.dart';
import 'package:study/com/tabs/home.tab.dart';
import 'package:study/com/tabs/photo.tab.dart';
import 'package:study/com/tabs/camera.tab.dart';
import 'package:study/com/tabs/message.tab.dart';
import 'package:study/com/tabs/account.tab.dart';

// theme
// ignore: non_constant_identifier_names
final Map BOTTOM_NAV_BAR = {
  'BACKGROUND_COLOR': Colors.white,
  'ICON_COLOR': Colors.black87,
  'TEXT_COLOR': Colors.black87
};

// tabs
// ignore: non_constant_identifier_names
final Map HOME_TAB = {
  'title': 'Home',
  'icon': Icons.home,
  'index': 0,
  'entity': HomeTab.create(),
  'path': '/home'
};

// ignore: non_constant_identifier_names
final Map PHOTO_TAB = {
  'title': 'Photos',
  'icon': Icons.image,
  'index': 1,
  'entity': PhotoTab.create(),
  'path': '/photo'
};

// ignore: non_constant_identifier_names
final Map CAMERA_TAB = {
  'title': 'Camera',
  'icon': Icons.camera,
  'index': 2,
  'entity': CameraTab.create(),
  'path': '/camera'
};

// ignore: non_constant_identifier_names
final Map MESSAGE_TAB = {
  'title': 'Message',
  'icon': Icons.chat_bubble_outline,
  'index': 3,
  'entity': MessageTab.create(),
  'path': '/message'
};

// ignore: non_constant_identifier_names
final Map ACCOUNT_TAB = {
  'title': 'Account',
  'icon': Icons.account_circle,
  'index': 4,
  'entity': AccountTab.create(),
  'path': '/account'
};

List<Map> tabs =
    new List.of([HOME_TAB, PHOTO_TAB, CAMERA_TAB, MESSAGE_TAB, ACCOUNT_TAB]);

// GPS误差
// ignore: non_constant_identifier_names
final Map GPS = {'longitude': 0.00421, 'latitude': -0.002272};
