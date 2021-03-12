import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Cuisine.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantDetailCategory.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';

import 'base_section/restaurant_detail_base_cuisine_section.dart';

class RestaurantDetailCategoryWidget extends StatefulWidget {
  final RestaurantDetailCategory category;

  RestaurantDetailCategoryWidget({
    @required this.category,
  });

  @override
  _RestaurantDetailCategoryWidgetState createState() =>
      _RestaurantDetailCategoryWidgetState();
}

class _RestaurantDetailCategoryWidgetState
    extends RestaurantDetailBaseCuisineSection<RestaurantDetailCategoryWidget> {
  @override
  DynamicHeading get heading => DynamicHeading(
      texts: [DynamicHeadingText(text: widget.category.categoryName)]);

  @override
  List<Cuisine> get cuisines => widget.category.cuisines;

  @override
  String get subtitle => "";
}
