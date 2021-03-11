import 'package:flutter/material.dart';

class Circle extends StatelessWidget {
  final int size;
  final Color color;

  Circle({@required this.size, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.symmetric(horizontal: 4),
      child: Icon(
        Icons.circle,
        color: color,
        size: size.toDouble() ?? 4,
      ),
    );
  }
}
