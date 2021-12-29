import 'package:flutter/material.dart';
import 'package:highschool/util/styles/color.dart';

wrapBoxDecoration(
    Color color, Color borderColor, double borderWidth, double borderRadius) {
  return BoxDecoration(
      color: color,
      border: Border.all(color: borderColor, width: borderWidth),
      borderRadius: BorderRadius.all(Radius.circular(borderRadius)));
}
