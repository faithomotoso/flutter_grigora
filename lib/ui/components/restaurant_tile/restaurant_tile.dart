import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/ui/components/network_image/network_image.dart';
import 'package:flutter_grigora/ui/components/rating/ratings_filled_widget.dart';
import 'package:flutter_grigora/ui/components/tile/tile_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_subtitle_text.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:flutter_grigora/utils/utils.dart';

class RestaurantTile extends StatelessWidget {
  final Restaurant restaurant;
  final Function(Restaurant restaurant) onRestaurantTapped; // needed?

  RestaurantTile({@required this.restaurant, this.onRestaurantTapped});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              // width: 160,
              height: 150,
              child: ClipRRect(
                borderRadius: appBorderRadius,
                child: AppNetworkImage(
                  imageUrl: restaurant.imageUrl,
                  fit: BoxFit.cover,
                ),
              ),
            ),
          ),
          SizedBox(
            width: 10,
          ),
          Expanded(flex: 2, child: details(context)),
        ],
      ),
    );
  }

  Widget details(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          TileHeading(
            title: Text(
              restaurant.name,
              style: AppFontStyles.headline6Bold(context),
            ),
            showViewAllButton: false,
            subtitle: Text(
              restaurant.distanceString,
            ),
          ),
          SizedBox(
            height: 10,
          ),
          Row(
            children: [
              RatingsFilledWidget(
                rating: restaurant.averageRating,
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 4),
                child: Icon(
                  Icons.circle,
                  color: AppColors.yellow,
                  size: 10,
                ),
              ),
              Text("${restaurant.preparingTime} min${restaurant.preparingTime == 1 ? "" : "s"}")
            ],
          )
        ],
      ),
    );
  }
}
