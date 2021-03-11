import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/ui/components/restaurant_tile/restaurant_tile.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_subtitle_text.dart';
import 'package:flutter_grigora/utils/utils.dart';

abstract class RestaurantBaseSection<T extends StatefulWidget>
    extends State<T> {
  // Reusable base for restaurant sections

  List<Restaurant> get items;

  DynamicHeading get heading;

  String get subtitle;

  Axis get scrollDirection;

  bool get showViewAllButton;

  bool get isVertical => scrollDirection == Axis.vertical ? true : false;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: !isVertical ? 250 : null,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          headingWidget(),
          !isVertical
              ? Expanded(
                  child: itemsWidget(),
                )
              : itemsWidget()
        ],
      ),
    );
  }

  Widget headingWidget() {
    return Padding(
      padding: bodyPadding,
      child: TileHeading(
        title: heading,
        showViewAllButton: showViewAllButton,
        subtitle: TileSubtitleText(
          text: subtitle,
        ),
      ),
    );
  }

  Widget itemsWidget() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: !isVertical ? 16 : 0,
        height: isVertical ? 14 : 0,
      ),
      itemCount: items.length,
      scrollDirection: scrollDirection,
      padding: bodyPadding,
      physics: !isVertical
          ? BouncingScrollPhysics()
          : NeverScrollableScrollPhysics(),
      shrinkWrap: isVertical ? true : false,
      itemBuilder: (context, index) => SizedBox(
        width: !isVertical ? 400 : null,
        child: RestaurantTile(
          restaurant: items.elementAt(index),
          asHorizontal: !isVertical,
        ),
      ),
    );
  }
}
