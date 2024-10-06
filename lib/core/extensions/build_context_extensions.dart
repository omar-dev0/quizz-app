import 'package:flutter/material.dart';

extension AppExtensions on BuildContext{
  ColorScheme? get appColors => Theme.of(this).colorScheme;
  TextTheme get appText => Theme.of(this).textTheme;
  double get width => MediaQuery.of(this).size.width;
  double get height => MediaQuery.of(this).size.height;
}