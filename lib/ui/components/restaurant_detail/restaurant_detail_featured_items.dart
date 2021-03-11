import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantItem.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/utils/colors.dart';

import 'base_section/restaurant_detail_base_section.dart';

class RestaurantDetailFeaturedItems extends StatefulWidget {
  final List<RestaurantItem> featuredItems;

  RestaurantDetailFeaturedItems({@required this.featuredItems});

  @override
  _RestaurantDetailFeaturedItemsState createState() =>
      _RestaurantDetailFeaturedItemsState();
}

class _RestaurantDetailFeaturedItemsState
    extends RestaurantDetailBaseSection<RestaurantDetailFeaturedItems> {
  @override
  DynamicHeading get heading => DynamicHeading(texts: [
        DynamicHeadingText(text: "Featured", textColor: AppColors.yellow),
        DynamicHeadingText(text: " Items")
      ]);

  @override
  List<RestaurantItem> get items => widget.featuredItems;

  @override
  String get subtitle => "Vendors featured items";
}
