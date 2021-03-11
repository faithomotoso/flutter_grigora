import 'dart:math';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

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

String genRandomDouble() {
  return Random().nextDouble().toStringAsFixed(2);
}

String formatAmountWithCurrency(double amount) {
  NumberFormat numberFormat =
      NumberFormat.currency(symbol: "\u20A6", decimalDigits: 2);

  return numberFormat.format(amount);
}

String formatTime(String time) {
  DateFormat dateFormat = DateFormat("hh:mm");
  String date = DateTime.now().toString().split(" ").first;
  return dateFormat.format(DateTime.parse("$date $time"));
}
