import 'package:flutter/material.dart';
import 'package:highschool/util/const/images.dart';
import 'package:highschool/util/styles/color.dart';

class LoginHeaderWidget extends StatelessWidget {
  const LoginHeaderWidget({Key key, this.title}) : super(key: key);
  final String title;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: <Widget>[
        Positioned.fill(
          child: Image.asset(
            LOGIN_highSchool,
            fit: BoxFit.fill,
          ),
        ),
        Container(
          color: LOGIN_imageBackgroundColor,
          alignment: Alignment.center,
          child: Text(
            title,
            style: TextStyle(
                fontSize: 20,
                color: Colors.white,
                fontFamily: "PermanentMarker"),
          ),
        )
      ],
    );
  }
}
