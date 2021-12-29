import 'package:flutter/material.dart';
import 'package:highschool/component/box/sized.dart';
import 'package:highschool/screen/login/header.dart';
import 'package:highschool/screen/login/login.dart';
import 'package:highschool/util/device/index.dart' as helper;
import 'package:highschool/util/styles/box.dart';
import 'package:highschool/util/styles/color.dart';
import 'package:highschool/util/styles/text.dart';

class LoginRolePage extends StatefulWidget {
  @override
  _LoginRoleState createState() => _LoginRoleState();
}

class _LoginRoleState extends State<LoginRolePage> {
  double bottomInsight;
  double deviceHeight;
  double deviceWidth;

  @override
  Widget build(BuildContext context) {
    bottomInsight = helper.HelperDevice.deviceBottomInsight(context);
    deviceHeight = helper.HelperDevice.deviceHeight(context);
    deviceWidth = helper.HelperDevice.deviceWidth(context);

    var headerStack = LoginHeaderWidget(title: "Education System");
    return Scaffold(
        resizeToAvoidBottomInset: false,
        backgroundColor: LOGIN_backgroundColor,
        body: Stack(children: <Widget>[
          Container(
            child: headerStack,
            height: deviceHeight * 0.5,
          ),
          Container(
              margin: EdgeInsets.only(top: deviceHeight * 0.5 - 30),
              height: deviceHeight * 0.3,
              child: Row(
                children: <Widget>[
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        child: Container(
                          decoration: wrapBoxDecoration(
                              Colors.white, Colors.white12, 3, 15),
                          width: deviceWidth * 0.5 - 16,
                          child: Flex(
                            direction: Axis.vertical,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: wrapBoxDecoration(Colors.grey[350],
                                    ROLE_boxBorderColor, 3, 10),
                                child: Icon(
                                  Icons.person,
                                  size: deviceHeight * 0.10,
                                  color: Colors.white24,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Personel",
                                style: roleTitleStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: deviceHeight * 0.25, left: 16),
                        width: deviceWidth * 0.4,
                        child: RaisedButton(
                          onPressed: () {},
                          color: LOGIN_submitButtonColor,
                          child: Container(
                            child: Text(
                              "Olarak Devam Et",
                              softWrap: false,
                              textAlign: TextAlign.center,
                              style: roleTitleTextStyle,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                  Stack(
                    children: <Widget>[
                      Padding(
                        padding:
                            EdgeInsets.symmetric(vertical: 15, horizontal: 8),
                        child: Container(
                          decoration: wrapBoxDecoration(
                              Colors.white, Colors.white12, 3, 15),
                          width: deviceWidth * 0.5 - 16,
                          child: Flex(
                            direction: Axis.vertical,
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: <Widget>[
                              Container(
                                decoration: wrapBoxDecoration(Colors.grey[350],
                                    ROLE_boxBorderColor, 3, 10),
                                child: Icon(
                                  Icons.person,
                                  size: deviceHeight * 0.10,
                                  color: Colors.white24,
                                ),
                              ),
                              SizedBox(
                                height: 20,
                              ),
                              Text(
                                "Veli",
                                style: roleTitleStyle,
                              ),
                            ],
                          ),
                        ),
                      ),
                      Container(
                        margin:
                            EdgeInsets.only(top: deviceHeight * 0.25, left: 16),
                        width: deviceWidth * 0.4,
                        child: RaisedButton(
                          onPressed: () {},
                          color: LOGIN_submitButtonColor,
                          child: Container(
                            child: Text(
                              "Olarak Devam Et",
                              softWrap: false,
                              textAlign: TextAlign.center,
                              style: roleTitleTextStyle,
                            ),
                          ),
                        ),
                      )
                    ],
                  ),
                ],
              )),
        ]));
  }
}
