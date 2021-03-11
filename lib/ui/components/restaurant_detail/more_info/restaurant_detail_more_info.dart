import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantDetail.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:flutter_grigora/utils/utils.dart';

class RestaurantDetailMoreInfo extends StatelessWidget {
  final RestaurantDetail restaurantDetail;

  RestaurantDetailMoreInfo({@required this.restaurantDetail});

  List<Widget> infoTiles;

  @override
  Widget build(BuildContext context) {
    infoTiles = [
      _infoTile(context,
          iconData: Icons.location_on_outlined,
          headerText: "Address",
          infoText: restaurantDetail.address),
      _infoTile(context,
          iconData: Icons.access_time_rounded,
          headerText: "Opening Time",
          infoText: restaurantDetail.openingTime),
      _infoTile(context,
          iconData: Icons.access_time_rounded,
          headerText: "Closing Time",
          infoText: restaurantDetail.closingTime),
      _infoTile(context,
          iconData: Icons.star_outline,
          headerText: "Average Rating",
          infoText:
              "${restaurantDetail.totalRating} Star${restaurantDetail.totalRating == 1 ? "" : "s"}"),
    ];

    return SingleChildScrollView(
      physics: BouncingScrollPhysics(),
      child: Padding(
        padding: bodyPadding.copyWith(top: 0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              restaurantDetail.restaurantName,
              style: AppFontStyles.headline5Bold(context),
            ),
            SizedBox(
              height: 14,
            ),
            ListView.separated(
              separatorBuilder: (context, index) => SizedBox(
                height: 10,
              ),
              physics: NeverScrollableScrollPhysics(),
              itemCount: infoTiles.length,
              shrinkWrap: true,
              padding: EdgeInsets.symmetric(horizontal: 10),
              itemBuilder: (context, index) => infoTiles.elementAt(index),
            )
          ],
        ),
      ),
    );
  }

  Widget _infoTile(BuildContext context,
      {@required IconData iconData, @required headerText, @required infoText}) {
    return ListTile(
      leading: Icon(
        iconData,
        color: AppColors.yellow,
      ),
      title: Text(
        headerText,
        style: AppFontStyles.headline6Bold(context),
      ),
      subtitle: Text(infoText),
    );
  }
}
