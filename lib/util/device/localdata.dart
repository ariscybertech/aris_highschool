import 'package:flutter/material.dart';
import 'package:highschool/util/base/index.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LocalData {
  static setData(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    await prefs.setString(UserState.userID.value, val);
  }

  static Future<String> getData(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    var data = prefs.getString(UserState.userID.value);
    return data;
  }
}

class UserState<String> extends Enum<String> {
  const UserState(String value) : super(value);

  static const UserState userID = const UserState("userID");
}
