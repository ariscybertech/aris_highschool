import 'package:flutter/material.dart';

class CustomBox extends StatelessWidget {
  final Widget child;
  double height;

  CustomBox({Key key, this.child, this.height}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: height,
      child: Container(
        child: child,
      ),
    );
  }
}
