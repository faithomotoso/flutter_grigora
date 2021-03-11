import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantDetail.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:flutter_grigora/utils/colors.dart';

class RestaurantDetailTimeFee extends StatelessWidget {
  final RestaurantDetail restaurantDetail;

  RestaurantDetailTimeFee({@required this.restaurantDetail});

  TextStyle headerTextStyle = TextStyle(color: AppColors.yellow);
  TextStyle detailTextStyle;

  @override
  Widget build(BuildContext context) {
    detailTextStyle =
        AppFontStyles.headline6Bold(context).copyWith(color: Colors.white);

    return Wrap(
      runSpacing: 10,
      spacing: 12,
      alignment: WrapAlignment.center,
      children: [
        col(
          title: _headerText("Min. Order"),
          detail: _detailText(restaurantDetail.minOrderAmount),
        ),
        col(
          title: _headerText("Prep. Time"),
          detail: _detailText("${restaurantDetail.prepTime} mins"),
        ),
        col(
          title: _headerText("Delivery Fee"),
          detail: _detailText("From ${restaurantDetail.deliveryFeeWithCurrency}"),
        )
      ],
    );
  }

  Widget _headerText(String header) {
    return Text(
      header,
      style: headerTextStyle,
    );
  }

  Widget _detailText(String detail) {
    return Text(
      detail,
      style: detailTextStyle,
    );
  }

  Widget col({@required Widget title, @required Widget detail}) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        title,
        SizedBox(
          height: 4,
        ),
        detail
      ],
    );
  }
}
