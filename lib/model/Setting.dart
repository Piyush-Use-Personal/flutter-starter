import 'dart:ui';

import 'package:flutter/material.dart';

class Setting {
  // one time fields
  String appName = '';

  // theme related fields
  String mainColor;
  String mainDarkColor;
  String secondColor;
  String secondDarkColor;
  String accentColor;
  String accentDarkColor;
  String scaffoldColor;
  String scaffoldDarkColor;

  // app version to check and update the version
  String appVersion;
  bool enableVersion = true;

  // user platform setting
  ValueNotifier<Locale> mobileLanguage = new ValueNotifier(Locale('en', ''));
  ValueNotifier<Brightness> brightness = new ValueNotifier(Brightness.light);

  // TODO
  // You can also adds fiels such as payment gateway enabling or default items
  // Firebase Id
  // DO NOT ADD USER DETAILS HERE

  // empty constructor
  Setting();

  // named constructor to set the fields
  Setting.fromJSON(Map<String, dynamic> jsonMap) {
    try {
      appName = jsonMap['app_name'] ?? null;
      mainColor = jsonMap['main_color'] ?? null;
      mainDarkColor = jsonMap['main_dark_color'] ?? '';
      secondColor = jsonMap['second_color'] ?? '';
      secondDarkColor = jsonMap['second_dark_color'] ?? '';
      accentColor = jsonMap['accent_color'] ?? '';
      accentDarkColor = jsonMap['accent_dark_color'] ?? '';
      scaffoldDarkColor = jsonMap['scaffold_dark_color'] ?? '';
      scaffoldColor = jsonMap['scaffold_color'] ?? '';
      appVersion = jsonMap['app_version'] ?? '';
      enableVersion =
          jsonMap['enable_version'] == null || jsonMap['enable_version'] == '0'
              ? false
              : true;
    } catch (error) {
      // log the error here for reverting
    }
  }

  // map getter to get the fields
  Map toMap() {
    var map = new Map<String, dynamic>();
    map["appName"] = appName;
    map["mainColor"] = mainColor;
    map["mainDarkColor"] = mainDarkColor;
    map["secondColor"] = secondColor;
    map["secondDarkColor"] = secondDarkColor;
    map["accentDarkColor"] = accentDarkColor;
    map["accentColor"] = accentColor;
    map["scaffoldColor"] = scaffoldColor;
    map["scaffoldDarkColor"] = scaffoldDarkColor;
    map["appVersion"] = appVersion;
    map["enableVersion"] = enableVersion;
    map["mobileLanguage"] = mobileLanguage;
    map["brightness"] = brightness;

    return map;
  }
}
