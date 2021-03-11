import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantDetail.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/ui/components/app_future_builder.dart';
import 'package:flutter_grigora/ui/components/button/round_button.dart';
import 'package:flutter_grigora/ui/components/circle.dart';
import 'package:flutter_grigora/ui/components/network_image/network_image.dart';
import 'package:flutter_grigora/ui/components/rating/ratings_outline_with_review.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/restaurant_detail_time_fee.dart';
import 'package:flutter_grigora/ui/components/scaffold/app_scaffold.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:flutter_grigora/utils/utils.dart';
import 'package:provider/provider.dart';

class RestaurantDetailWidget extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantDetailWidget({@required this.restaurant});

  @override
  _RestaurantDetailWidgetState createState() => _RestaurantDetailWidgetState();
}

class _RestaurantDetailWidgetState extends State<RestaurantDetailWidget> {
  RestaurantDetail restaurantDetail;
  Future detailFuture;

  List<RoundButton> actionButtons;

  @override
  void initState() {
    super.initState();
    getDetail();
  }

  @override
  Widget build(BuildContext context) {
    actionButtons = [
      RoundButton(
        child: Row(
          // mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.min,
          children: [
            Text(
              "Delivery",
            ),
            SizedBox(
              width: 30,
            ),
            Text("|"),
            Icon(Icons.keyboard_arrow_down)
          ],
        ),
        onPressed: () {},
        buttonColor: Colors.white,
      ),
      RoundButton(
          child: Row(
            children: [
              Icon(
                Icons.people_outline,
                color: Colors.white,
              ),
              SizedBox(
                width: 4,
              ),
              Text(
                "Start Group Order",
                style: TextStyle(color: Colors.white),
              ),
            ],
          ),
          borderColor: Colors.white,
          onPressed: () {}),
      RoundButton(
          child: Text(
            "Book A Table",
            style: TextStyle(color: Colors.white),
          ),
          borderColor: Colors.white,
          onPressed: () {})
    ];

    return AppScaffold(
        showBackButton: true,
        child: AppFutureBuilder(
          future: detailFuture,
          onRefresh: () {
            setState(() {
              getDetail();
            });
          },
          child: ListView(
            children: [topWidget()],
          ),
        ));
  }

  void getDetail() {
    detailFuture = Provider.of<AppViewModel>(context, listen: false)
        .getRestaurantDetail()
        .then((value) {
      if (value is RestaurantDetail)
        setState(() {
          restaurantDetail = value;
        });
      return value;
    });
  }

  Widget topWidget() {
    if (restaurantDetail == null) return SizedBox();

    return Stack(
      children: [
        Positioned.fill(
            child: AppNetworkImage(
          imageUrl: restaurantDetail.profileImageUrl,
          fit: BoxFit.cover,
        )),
        Positioned.fill(
            child: Container(
          color: Colors.black.withOpacity(0.85),
        )),
        Container(
          // height: 100,
          width: MediaQuery.of(context).size.width,
          padding: bodyPadding.copyWith(left: 0, right: 0, bottom: 20),
          child: Column(
            children: [
              CircleAvatar(
                backgroundImage:
                    CachedNetworkImageProvider(restaurantDetail.imageUrl),
                radius: 75,
              ),
              SizedBox(
                height: 4,
              ),
              Text(
                restaurantDetail.restaurantName,
                style: AppFontStyles.headline5Bold(context)
                    .copyWith(color: Colors.white),
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                restaurantDetail.cuisines,
                style: AppFontStyles.body1(context)
                    .copyWith(color: Colors.white, fontWeight: FontWeight.bold),
              ),
              SizedBox(
                height: 10,
              ),
              reviewsAndDistance(),
              SizedBox(
                height: 5,
              ),
              acceptingStatusAndMoreInfo(),
              Padding(
                padding: bodyPadding.copyWith(top: 0, bottom: 0),
                child: Divider(
                  color: Colors.white,
                  thickness: 0.5,
                  height: 30,
                ),
              ),
              RestaurantDetailTimeFee(restaurantDetail: restaurantDetail),
              SizedBox(
                height: 14,
              ),
              actionButtonsList(),
              SizedBox(
                height: 15,
              ),
              lunchButton(),
            ],
          ),
        ),
      ],
    );
  }

  Widget reviewsAndDistance() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        RatingsOutlineWithReview(
          rating: restaurantDetail.totalRating,
          review: restaurantDetail.totalReview,
          color: Colors.white,
        ),
        Circle(
          size: 8,
          color: Colors.white,
        ),
        Text(
          restaurantDetail.distanceString,
          style: TextStyle(color: Colors.white),
        )
      ],
    );
  }

  Widget acceptingStatusAndMoreInfo() {
    return Row(
      mainAxisSize: MainAxisSize.min,
      children: [
        Container(
          decoration: BoxDecoration(
              color: AppColors.red, borderRadius: appBorderRadius),
          padding: bodyPadding,
          child: Center(
            child: Text(
              "NOT ACCEPTING",
              style:
                  TextStyle(fontWeight: FontWeight.bold, color: Colors.white),
            ),
          ),
        ),
        Circle(size: 8, color: Colors.white),
        TextButton(
            onPressed: () {
              // todo more info dialog
            },
            child: Row(
              mainAxisSize: MainAxisSize.min,
              children: [
                Icon(
                  Icons.info_outline,
                  color: Colors.white,
                ),
                SizedBox(
                  width: 4,
                ),
                Text(
                  "MORE INFO",
                  style: TextStyle(
                      color: Colors.white, fontWeight: FontWeight.bold),
                )
              ],
            ))
      ],
    );
  }

  Widget actionButtonsList() {
    return SizedBox(
      height: 34,
      width: MediaQuery.of(context).size.width,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 10,
        ),
        physics: BouncingScrollPhysics(),
        padding: EdgeInsets.symmetric(horizontal: 10),
        scrollDirection: Axis.horizontal,
        itemCount: actionButtons.length,
        itemBuilder: (context, index) => actionButtons.elementAt(index),
      ),
    );
  }

  Widget lunchButton() {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text(
          "Choose a Menu",
          style: TextStyle(color: AppColors.yellow),
        ),
        RoundButton(
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 30.0),
                child: Center(
                  child: Text("Lunch",
                      style: TextStyle(
                          color: AppColors.yellow,
                          fontWeight: FontWeight.bold)),
                ),
              ),
              Text(
                "|",
                style: TextStyle(color: AppColors.yellow),
              ),
              Icon(
                Icons.keyboard_arrow_down,
                color: AppColors.yellow,
              )
            ],
          ),
          onPressed: () {},
          borderColor: AppColors.yellow,
        )
      ],
    );
  }
}
