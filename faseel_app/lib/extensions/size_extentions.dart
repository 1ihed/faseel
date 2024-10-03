import 'package:flutter/material.dart';

extension ScreenExtension on BuildContext {
  double getWidth({double divide = 1}) {
    return MediaQuery.sizeOf(this).width / divide;
  }

  double getHeight({double divide = 1}) {
    return MediaQuery.sizeOf(this).height / divide;
  }

  double getWidthM({double multiply = 1}) {
    return MediaQuery.sizeOf(this).width * multiply;
  }

  double getHeightM({double multiply = 1}) {
    return MediaQuery.sizeOf(this).height * multiply;
  }
}
