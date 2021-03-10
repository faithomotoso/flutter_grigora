import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Cuisine.dart';
import 'package:flutter_grigora/ui/components/loading_indicator.dart';
import 'package:flutter_grigora/ui/components/network_image/network_image.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';

class CuisineTile extends StatelessWidget {
  final Cuisine cuisine;
  final Function(Cuisine cuisine) onCuisineTapped;

  CuisineTile({@required this.cuisine, this.onCuisineTapped});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        onCuisineTapped?.call(cuisine);
      },
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Expanded(
              child: AppNetworkImage(
            imageUrl: cuisine.backgroundIconUrl,
          )),
          SizedBox(
            height: 10,
          ),
          Text(
            cuisine.name,
            style: AppFontStyles.body1(context)
                .copyWith(fontWeight: FontWeight.bold),
          )
        ],
      ),
    );
  }
}
