import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/rating/ratings_outline.dart';

class RatingsOutlineWithReview extends StatelessWidget {
  final double rating;
  final int review;
  final Color color;

  RatingsOutlineWithReview(
      {@required this.rating,
      @required this.review,
      this.color = Colors.white});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingsOutlineWidget(rating: rating, color: Colors.white),
        SizedBox(
          width: 4,
        ),
        Text(
          "($review REVIEW${review == 1 ? "" : "S"})",
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }
}
