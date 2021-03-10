import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:flutter_grigora/utils/utils.dart';
import 'package:flutter_grigora/utils/extensions/double_extension.dart';

class RatingsFilledWidget extends StatelessWidget {
  final double rating;

  RatingsFilledWidget({@required this.rating});

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: ratingColor,
        borderRadius: appBorderRadius
      ),
      padding: bodyPadding.copyWith(top: 5, bottom: 5),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.star, color: Colors.white, size: 20,),
          SizedBox(width: 5),
          Text(
            rating.formatDouble().toString(),
            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }

  Color get ratingColor {
    Color bg;
    if (rating == 0 ) bg = Colors.black87;
    else if (rating >=1 && rating < 4) bg = AppColors.yellow;
    else if (rating >= 4) bg = AppColors.green;
    return bg;
  }
}
