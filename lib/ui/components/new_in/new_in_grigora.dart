import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/ui/components/restaurant_tile/restaurant_tile.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_subtitle_text.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_grigora/lib/ui/components/tile/tile_heading.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:flutter_grigora/utils/utils.dart';
import 'package:provider/provider.dart';

class NewInGrigora extends StatefulWidget {
  @override
  _NewInGrigoraState createState() => _NewInGrigoraState();
}

class _NewInGrigoraState extends State<NewInGrigora> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 250,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          heading(),
          Expanded(child: body()),
        ],
      ),
    );
  }

  Widget heading() {
    return Padding(
      padding: bodyPadding,
      child: TileHeading(
        title: DynamicHeading(texts: [
          DynamicHeadingText(text: "New", textColor: AppColors.yellow),
          DynamicHeadingText(text: " in Grigora")
        ]),
        subtitle: TileSubtitleText(
          text: "Recently added vendors",
        ),
      ),
    );
  }

  Widget body() {
    List<Restaurant> restaurants = context.read<AppViewModel>().restaurants;
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 16,
      ),
      itemCount: restaurants.length,
      scrollDirection: Axis.horizontal,
      padding: bodyPadding,
      physics: BouncingScrollPhysics(),
      itemBuilder: (context, index) => SizedBox(
        width: 400,
        child: RestaurantTile(
          restaurant: restaurants.elementAt(index),
          asHorizontal: true,
        ),
      ),
    );
  }
}
