import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

Future pushWithSettings(
    {@required BuildContext context, @required Widget newPage}) {
  // pushing screens with settings adding a name to them
  return Navigator.push(
      context,
      CupertinoPageRoute(
          settings: RouteSettings(
            name: newPage.runtimeType.toString(),
          ),
          builder: (_) => newPage));
}

EdgeInsets bodyPadding = EdgeInsets.all(10);

BorderRadius appBorderRadius = BorderRadius.circular(6);