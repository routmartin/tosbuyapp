import 'package:flutter/material.dart';

class ScreenHelper {
  static bool isMobile(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide < 600;
  }

  static bool isTablet(BuildContext context) {
    var shortestSide = MediaQuery.of(context).size.shortestSide;
    return shortestSide > 600;
  }

  static ScreenType screenType(BuildContext context) {
    if (isMobile(context)) {
      return ScreenType.mobile;
    } else {
      return ScreenType.tablet;
    }
  }
}

enum ScreenType { mobile, tablet }
