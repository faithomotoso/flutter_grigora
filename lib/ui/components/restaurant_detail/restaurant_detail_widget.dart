import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantDetail.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/ui/components/app_future_builder.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/restaurant_detail_overview.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/restuarant_detail_popular_items.dart';
import 'package:flutter_grigora/ui/components/scaffold/app_scaffold.dart';
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

  @override
  void initState() {
    super.initState();
    getDetail();
  }

  @override
  Widget build(BuildContext context) {
    return AppScaffold(
        showBackButton: true,
        child: AppFutureBuilder(
          future: detailFuture,
          onRefresh: () {
            setState(() {
              getDetail();
            });
          },
          child: CustomScrollView(
            slivers: [
              topWidget(),
              SliverAppBar(
                pinned: true,
                title: Text("Sample sliver appbar"),
                expandedHeight: 100,
              ),
              body()
            ],
          ),
          // child: ListView(
          //   children: [topWidget(),
          //   ],
          // ),
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

    return SliverToBoxAdapter(
      child: RestaurantDetailOverview(
        restaurantDetail: restaurantDetail,
      ),
    );
  }

  Widget body() {
    if (restaurantDetail == null) return SizedBox();

    return SliverToBoxAdapter(
      child: Column(
        children: [
          RestaurantDetailPopularItems(
              popularItems: restaurantDetail.popularItems),
        ],
      ),
    );
  }
}
