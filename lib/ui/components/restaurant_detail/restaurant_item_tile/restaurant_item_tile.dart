import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantItem.dart';
import 'package:flutter_grigora/ui/components/network_image/network_image.dart';
import 'package:flutter_grigora/ui/components/rating/ratings_filled_widget.dart';
import 'package:flutter_grigora/ui/components/tile/tile_heading.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:flutter_grigora/utils/utils.dart';

class RestaurantItemTile extends StatelessWidget {
  RestaurantItem restaurantItem;

  RestaurantItemTile({@required this.restaurantItem});

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Row(
        children: [
          Expanded(
            child: SizedBox(
              height: 160,
              child: ClipRRect(
                borderRadius: appBorderRadius,
                child: AppNetworkImage(
                  imageUrl: restaurantItem.imageUrl,
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
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          TileHeading(
            title: Text(
              restaurantItem.name,
              style: AppFontStyles.headline6Bold(context),
            ),
            showViewAllButton: false,
            subtitle: Text(
              restaurantItem.description,
              maxLines: 2,
              overflow: TextOverflow.ellipsis,
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              RatingsFilledWidget(rating: restaurantItem.averageRating),
              SizedBox(
                width: 4,
              ),
              Container(
                decoration: BoxDecoration(
                    color: AppColors.yellow, borderRadius: appBorderRadius),
                padding: bodyPadding,
                child: Text(
                  restaurantItem.cuisineName,
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                ),
              )
            ],
          ),
          SizedBox(
            height: 10,
          ),
          Text(
            formatAmountWithCurrency(restaurantItem.price),
            style: TextStyle(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
