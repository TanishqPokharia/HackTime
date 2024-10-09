import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:hack_time/main.dart';
import 'package:hack_time/utils/screen_height.dart';

extension ResponsiveContext on BuildContext{
  double get screenHeight => MediaQuery.sizeOf(this).height;
  double get screenWidth => MediaQuery.sizeOf(this).height;

  TextTheme get textTheme => Theme.of(this).textTheme;

}

extension ResponsiveSize on num {
  double get rs => getIt<ScreenHeight>().value * (this/1000);
}