import 'package:flutter/material.dart';

class ScreenSize {
  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double get appBarHeight => kToolbarHeight;

  static double get footerHeight => 40.0;
}
