import 'package:flutter/material.dart';

class RoundButton extends StatelessWidget {
  final Widget child;
  final VoidCallback onPressed;
  final Color borderColor;
  final Color buttonColor;

  RoundButton(
      {@required this.child,
      @required this.onPressed,
      this.borderColor = Colors.transparent,
      this.buttonColor = Colors.transparent});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onPressed?.call,
        child: child,
        style: ButtonStyle(
          shape: MaterialStateProperty.all(StadiumBorder()),
          elevation: MaterialStateProperty.all(0.0),
          side: MaterialStateProperty.all<BorderSide>(
              BorderSide(color: borderColor, width: 1)),
          backgroundColor: MaterialStateProperty.all<Color>(buttonColor),
        ));
  }
}
