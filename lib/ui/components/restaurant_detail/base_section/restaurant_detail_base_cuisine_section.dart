import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Cuisine.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/restaurant_detail_cuisine/restaurant_detail_cuisine_tile.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_subtitle_text.dart';
import 'package:flutter_grigora/utils/utils.dart';

abstract class RestaurantDetailBaseCuisineSection<T extends StatefulWidget> extends State<T> {
  List<Cuisine> cuisines;

  DynamicHeading get heading;

  String get subtitle;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        headingWidget(),
        itemsWidget(),
      ],
    );
  }

  Widget headingWidget() {
    return Padding(
      padding: bodyPadding.copyWith(bottom: 0),
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
        height: 16,
      ),
      itemCount: cuisines.length,
      padding: bodyPadding.copyWith(top: 0,),
      shrinkWrap: true,
      physics: NeverScrollableScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
        // width: 400,
        child: RestaurantDetailCuisineTile(
          cuisine: cuisines.elementAt(index),
        ),
      ),
    );
  }
}