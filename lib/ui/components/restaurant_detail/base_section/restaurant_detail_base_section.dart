import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantItem.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/restaurant_item_tile/restaurant_item_tile.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_subtitle_text.dart';
import 'package:flutter_grigora/utils/utils.dart';

abstract class RestaurantDetailBaseSection<T extends StatefulWidget>
    extends State<T> {
  // Reusable section in restaurant detail
  List<RestaurantItem> get items;

  DynamicHeading get heading;

  String get subtitle;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          headingWidget(),
          Expanded(child: itemsWidget(),)
        ],
      ),
    );
  }

  Widget headingWidget() {
    return Padding(
      padding: bodyPadding,
      child: TileHeading(
        title: heading,
        showViewAllButton: false,
        subtitle: TileSubtitleText(
          text: subtitle,
        ),
      ),
    );
  }

  Widget itemsWidget() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 16,
      ),
      itemCount: items.length,
      scrollDirection: Axis.horizontal,
      padding: bodyPadding,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
        width: 400,
        child: RestaurantItemTile(
          restaurantItem: items.elementAt(index),
        ),
      ),
    );
  }
}
