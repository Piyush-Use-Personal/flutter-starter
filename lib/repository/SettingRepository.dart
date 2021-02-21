import 'package:flutter/material.dart';
import 'package:flutter_starter/model/Setting.dart';
import 'package:shared_preferences/shared_preferences.dart';

ValueNotifier<Setting> setting = new ValueNotifier(new Setting());
Future<Setting> initializeSetting() async {
  Setting _setting;
  SharedPreferences prefs = await SharedPreferences.getInstance();
  // you can create your own setting getter from a file, api call, other raw data
  var settings = new Map<String, dynamic>();
  settings["appName"] = 'Hello World';
  settings["mainColor"] = 'blue';
  settings["mainDarkColor"] = 'red';
  settings["secondColor"] = 'green';
  settings["secondDarkColor"] = 'yellow';
  settings["accentDarkColor"] = 'orange';
  settings["accentColor"] = 'white';
  settings["scaffoldColor"] = 'black';
  settings["scaffoldDarkColor"] = 'grey';
  settings["appVersion"] = '0';
  settings["enableVersion"] = false;

  _setting = Setting.fromJSON(settings);

  // to change the brightness or language use shared storage
  _setting.brightness.value =
      prefs.getBool('isBrightTheme') ? Brightness.light : Brightness.dark;
  return _setting;
}

Future<void> setThemeSelection(bool isBrightTheme) async {
  SharedPreferences prefs = await SharedPreferences.getInstance();
  await prefs.setBool('isBrightTheme', isBrightTheme);
}
