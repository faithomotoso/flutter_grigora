import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;
  final Function(Restaurant restaurant) onRestaurantTapped; // needed?

  RestaurantTile({@required this.restaurant, @required this.onRestaurantTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
    height: 150,
    );
  }

  Widget image() {
    // return ClipRRect()
  }
}
