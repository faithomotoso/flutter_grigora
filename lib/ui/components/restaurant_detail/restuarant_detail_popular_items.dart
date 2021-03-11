import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantItem.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/base_section/restaurant_detail_base_section.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/utils/colors.dart';

class RestaurantDetailPopularItems extends StatefulWidget {
  final List<RestaurantItem> popularItems;

  RestaurantDetailPopularItems({@required this.popularItems});

  @override
  _RestaurantDetailPopularItemsState createState() =>
      _RestaurantDetailPopularItemsState();
}

class _RestaurantDetailPopularItemsState
    extends RestaurantDetailBaseSection<RestaurantDetailPopularItems> {
  List<RestaurantItem> get popularItems => widget.popularItems;

  @override
  List<RestaurantItem> get items => widget.popularItems;

  @override
  String get subtitle => "Popular items in this restaurant";

  @override
  DynamicHeading get heading => DynamicHeading(texts: [
        DynamicHeadingText(text: "Popular", textColor: AppColors.yellow),
        DynamicHeadingText(text: " Items")
      ]);
}
