import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/ui/components/base/RestaurantSectionBase.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:provider/provider.dart';

class RestaurantsNearYou extends StatefulWidget {
  @override
  _RestaurantsNearYouState createState() => _RestaurantsNearYouState();
}

class _RestaurantsNearYouState extends RestaurantBaseSection<RestaurantsNearYou> {
  // @override
  // Widget build(BuildContext context) {
  //   return Padding(
  //     padding: bodyPadding,
  //     child: Column(
  //       crossAxisAlignment: CrossAxisAlignment.start,
  //       children: [
  //         heading(),
  //         SizedBox(height: 10,),
  //         body()
  //       ],
  //     ),
  //   );
  // }

  // Widget heading() {
  //   return TileHeading(
  //     title: DynamicHeading(texts: [
  //       DynamicHeadingText(text: "Restaurants "),
  //       DynamicHeadingText(text: "Near", textColor: AppColors.yellow),
  //       DynamicHeadingText(text: " You")
  //     ]),
  //     subtitle: TileSubtitleText(
  //       text: "Enjoy delicious meals from restaurants and vendors around you",
  //     ),
  //   );
  // }

  // Widget body() {
  //   List<Restaurant> restaurants = context.read<AppViewModel>().restaurants;
  //   return ListView.separated(
  //     separatorBuilder: (context, index) => SizedBox(height: 14,),
  //     itemCount: restaurants.length,
  //     shrinkWrap: true,
  //     physics: NeverScrollableScrollPhysics(),
  //     itemBuilder: (context, index) => RestaurantTile(restaurant: restaurants.elementAt(index)),
  //   );
  // }

  @override
  List<Restaurant> get items => context.read<AppViewModel>().restaurants;

  @override
  Axis get scrollDirection => Axis.vertical;

  @override
  bool get showViewAllButton => true;

  @override
  String get subtitle => "Enjoy delicious meals from restaurants and vendors around you";

  @override
  DynamicHeading get heading => DynamicHeading(texts: [
    DynamicHeadingText(text: "Restaurants "),
    DynamicHeadingText(text: "Near", textColor: AppColors.yellow),
    DynamicHeadingText(text: " You")
  ]);

}
