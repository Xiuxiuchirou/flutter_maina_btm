import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

void writeConfig(String index, String value) async {
  try {
    index = index.toLowerCase();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString("config" + index, value);
    return;
  } catch (ex) {
    print("writeConfig" + ex);
  }
}

/************************************************
   * 配置文件中的内容全部为  key:value
 ***********************************************/
Future<String> readConfig(String index) async {
  try {
    index = index.toLowerCase();
    SharedPreferences prefs = await SharedPreferences.getInstance();
    String result = await prefs.getString("config" + index);
    return result;
  } catch (ex) {
    print("readConfig" + ex);
  }
}
