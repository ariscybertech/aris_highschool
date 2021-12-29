import 'package:flutter/material.dart';

class HelperDevice {
  static int myVal = 12345;
  static double deviceWidth(BuildContext context) =>
      MediaQuery.of(context).size.width;
  static double deviceHeight(BuildContext context) =>
      MediaQuery.of(context).size.height;
  static double deviceBottomInsight(BuildContext context) =>
      MediaQuery.of(context).viewInsets.bottom;
}
