import 'package:flutter/material.dart';

class Styles {
  const Styles();

  //Global Style
  double get fontSize => 17;
  double get borderRadius => 8;
  MaterialColor get mainColorSwatch => Colors.indigo;
  Color? get darkTextColor => Colors.black;
  Color? get lightTextColor => Colors.white;
  Color? get backgroundColor => Colors.indigo[500];
  double get horizontalPadding => 28;

  //Primary Button
  double get primaryButtonFontSize => 17;
  double get primaryButtonBorderRadius => 8;
  double get primaryButtonVerticalPadding => 14;
  Color? get primaryButtonColor => Colors.indigo[600];
}
