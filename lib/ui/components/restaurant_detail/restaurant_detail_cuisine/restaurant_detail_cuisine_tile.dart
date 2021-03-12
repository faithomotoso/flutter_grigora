import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Cuisine.dart';
import 'package:flutter_grigora/ui/components/network_image/network_image.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:flutter_grigora/utils/utils.dart';

class RestaurantDetailCuisineTile extends StatelessWidget {
  final Cuisine cuisine;

  RestaurantDetailCuisineTile({@required this.cuisine});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: SizedBox(
            height: 150,
            child: ClipRRect(
              borderRadius: appBorderRadius,
              child: AppNetworkImage(
                imageUrl: cuisine.imageUrl,
                fit: BoxFit.cover,
              ),
            ),
          ),
        ),
        SizedBox(
          width: 10,
        ),
        Expanded(
            flex: 2,
            child: details(context))
      ],
    );
  }

  Widget details(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          cuisine.name,
          style: AppFontStyles.headline6Bold(context),
        ),
        SizedBox(height: 4,),
        Text(cuisine.description)
      ],
    );
  }
}
