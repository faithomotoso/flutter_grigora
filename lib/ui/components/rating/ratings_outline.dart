import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/utils/extensions/double_extension.dart';

class RatingsOutlineWidget extends StatelessWidget {
  final double rating;
  final Color color;

  RatingsOutlineWidget({@required this.rating, @required this.color});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Icon(Icons.star_border_rounded, color: color, size: 22,),
        SizedBox(width: 5),
        Text(
          rating.formatDouble().toString(),
          style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
        )
      ],
    );
  }
}
