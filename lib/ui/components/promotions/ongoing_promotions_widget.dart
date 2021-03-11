import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Promo.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/ui/components/loading_indicator.dart';
import 'package:flutter_grigora/ui/components/network_image/network_image.dart';
import 'package:flutter_grigora/utils/utils.dart';
import 'package:provider/provider.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';

class OngoingPromotionsWidget extends StatefulWidget {
  @override
  _OngoingPromotionsWidgetState createState() =>
      _OngoingPromotionsWidgetState();
}

class _OngoingPromotionsWidgetState extends State<OngoingPromotionsWidget> {
  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(color: Colors.black87),
      padding: bodyPadding.copyWith(left: 0, right: 0),
      // height: MediaQuery.of(context).size.height * 0.35,
      height: 220,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          header(),
          SizedBox(
            height: 10,
          ),
          Expanded(
            child: promotionImages(),
          )
        ],
      ),
    );
  }

  Widget header() {
    return Text(
      "ONGOING PROMOTIONS",
      style:
          AppFontStyles.headline6Bold(context).copyWith(color: Colors.white70),
    );
  }

  Widget promotionImages() {
    List<Promo> promotions = context.read<AppViewModel>().promos;
    return ListView.separated(
      separatorBuilder: (context, index) => SizedBox(
        width: 10,
      ),
      scrollDirection: Axis.horizontal,
      physics: BouncingScrollPhysics(),
      itemCount: promotions.length,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      itemBuilder: (context, index) {
        return SizedBox(
          width: 250,
          child: ClipRRect(
            borderRadius: appBorderRadius,
            child: AppNetworkImage(
              imageUrl: promotions.elementAt(index).imageUrl,
              // width: 250,
            ),
          ),
        );
      },
    );
  }
}
