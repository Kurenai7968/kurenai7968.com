import 'package:flutter/material.dart';

class ScreenSize {
  static const double mobileBreakPoint = 600;
  static const double tabletBreakPoint = 800;
  static const double desktopBreakPoint = 1380;
  static const double padding = 30;

  static bool isMobileSize(BuildContext context) {
    return tabletBreakPoint > MediaQuery.of(context).size.width;
  }

  static double height(BuildContext context) =>
      MediaQuery.of(context).size.height;

  static double width(BuildContext context) =>
      MediaQuery.of(context).size.width;

  static double appBarHeight() => kToolbarHeight;

  static double statusBarHeigh(BuildContext context) =>
      MediaQuery.of(context).viewPadding.top;

  static double get bannerHeight => 50;
}
