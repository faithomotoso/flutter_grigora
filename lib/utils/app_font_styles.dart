import 'package:flutter/material.dart';

class AppFontStyles {
  static ThemeData _getTheme(BuildContext context) {
    return Theme.of(context);
  }

  static TextStyle headline4(BuildContext context) =>
      _getTheme(context).textTheme.headline4;

  static TextStyle headline4Bold(BuildContext context) =>
      headline4(context).copyWith(fontWeight: FontWeight.bold,);

  static TextStyle headline5(BuildContext context) =>
      _getTheme(context).textTheme.headline5;

  static TextStyle headline5Bold(BuildContext context) =>
      headline5(context).copyWith(fontWeight: FontWeight.bold);

  static TextStyle headline6(BuildContext context) =>
      _getTheme(context).textTheme.headline6;

  static TextStyle headline6Bold(BuildContext context) =>
      headline6(context).copyWith(fontWeight: FontWeight.bold,);

  static TextStyle body1(BuildContext context) =>
      _getTheme(context).textTheme.bodyText1;
}
