import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantItem.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/restaurant_item_tile/restaurant_item_tile.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_subtitle_text.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:flutter_grigora/utils/utils.dart';
import 'package:provider/provider.dart';

class RestaurantDetailPopularItems extends StatefulWidget {
  final List<RestaurantItem> popularItems;

  RestaurantDetailPopularItems({@required this.popularItems});

  @override
  _RestaurantDetailPopularItemsState createState() => _RestaurantDetailPopularItemsState();
}

class _RestaurantDetailPopularItemsState extends State<RestaurantDetailPopularItems> {
  List<RestaurantItem> get popularItems => widget.popularItems;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          heading(),
          Expanded(child: itemsWidget(),)
        ],
      ),
    );
  }

  Widget heading() {
    return Padding(
      padding: bodyPadding,
      child: TileHeading(
        title: DynamicHeading(texts: [
          DynamicHeadingText(text: "Popular", textColor: AppColors.yellow),
          DynamicHeadingText(text: " Items")
        ]),
        showViewAllButton: false,
        subtitle: TileSubtitleText(
          text: "Popular items in this restaurant",
        ),
      ),
    );
  }

  Widget itemsWidget() {
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 16,
      ),
      itemCount: popularItems.length,
      scrollDirection: Axis.horizontal,
      padding: bodyPadding,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
        width: 400,
        child: RestaurantItemTile(
          restaurantItem: popularItems.elementAt(index),
        ),
      ),
    );
  }
}
