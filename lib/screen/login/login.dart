import 'dart:async';

import 'package:flutter/material.dart';
import 'package:highschool/screen/login/form.dart';
import 'package:highschool/screen/login/header.dart';
import 'package:highschool/screen/role/login.dart';
import 'package:highschool/util/device/index.dart' as helper;
import 'package:highschool/util/device/localdata.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  String title = "School Education System";

  double deviceWidth;
  double deviceHeight;
  double bottomInsight;
  double height = 20;

  @override
  void initState() {
    super.initState();
          startTime();

  }
  startTime() async {
    var _duration = new Duration(seconds: 1);
    return new Timer(_duration, navigationPage);
  }

  void navigationPage() { //landing screen replace with splash screen.
    Navigator.of(context).pushReplacementNamed('/loginrole');
  }
  @override
  Widget build(BuildContext context) {
    deviceWidth = helper.HelperDevice.deviceWidth(context);
    deviceHeight = helper.HelperDevice.deviceHeight(context);
    bottomInsight = helper.HelperDevice.deviceBottomInsight(context);

    var bodyWidget = LoginFormWidget();
    var headerStack = LoginHeaderWidget(title: this.title);
    return Scaffold(
        resizeToAvoidBottomInset: false,
        body: Stack(
          children: <Widget>[
            AnimatedContainer(
              duration: Duration(milliseconds: 500),
              height: heightHelper(bottomInsight),
              child: headerStack,
              curve: Curves.linear,
            ),
            AnimatedContainer(
                duration: Duration(milliseconds: 500),
                curve: Curves.linear,
                margin: EdgeInsets.only(top: marginTopHelper(bottomInsight)),
                child: bodyWidget),
          ],
        ));

  }

  double marginTopHelper(double bottom) {
    return bottom == 0 ? deviceHeight * 0.5 - 30 : deviceHeight * 0.2;
  }

  double heightHelper(double bottom) {
    return bottom == 0 ? deviceHeight * 0.5 : deviceHeight * 0.2;
  }
}
