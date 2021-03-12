import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Cuisine.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantDetailCategory.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/utils/colors.dart';

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
  DynamicHeading get heading => _dynamicHeading;

  @override
  List<Cuisine> get cuisines => widget.category.cuisines;

  @override
  String get subtitle => "";

  DynamicHeading get _dynamicHeading {
    List<String> nameList = widget.category.categoryName.split(" ");
    // Change the color of the first or second word, depending on the length

    List<DynamicHeadingText> texts = [
      DynamicHeadingText(text: nameList.first),
    ];

    if (nameList.length >= 2) {
      texts.addAll([
        DynamicHeadingText(
            text: " ${nameList.elementAt(1)}", textColor: AppColors.yellow),
        ...List<DynamicHeadingText>.from(
            nameList.skip(2).map((e) => DynamicHeadingText(text: " $e")))
      ]);
    }

    DynamicHeading heading = DynamicHeading(texts: texts);

    return heading;
  }
}
