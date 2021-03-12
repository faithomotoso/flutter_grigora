import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/business_logic/models/RestaurantDetail.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/ui/components/app_future_builder.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/restaurant_detail_category.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/restaurant_detail_overview.dart';
import 'package:flutter_grigora/ui/components/restaurant_detail/restaurant_detail_popular_items.dart';
import 'package:flutter_grigora/ui/components/scaffold/app_scaffold.dart';
import 'package:provider/provider.dart';
import 'package:scroll_to_index/scroll_to_index.dart';

class RestaurantDetailWidget extends StatefulWidget {
  final Restaurant restaurant;

  RestaurantDetailWidget({@required this.restaurant});

  @override
  _RestaurantDetailWidgetState createState() => _RestaurantDetailWidgetState();
}

class _RestaurantDetailWidgetState extends State<RestaurantDetailWidget> {
  RestaurantDetail restaurantDetail;
  Future detailFuture;
  AutoScrollController autoScrollController;

  @override
  void initState() {
    super.initState();
    getDetail();
    autoScrollController = AutoScrollController(
      axis: Axis.vertical,
      viewportBoundaryGetter: () =>
          Rect.fromLTRB(0, 0, 0, MediaQuery.of(context).padding.bottom),
    );
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
            controller: autoScrollController,
            physics: BouncingScrollPhysics(),
            slivers: [topWidget(), bodyAppBar(), body()],
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

  Widget bodyAppBar() {
    if (restaurantDetail == null) return SizedBox();
    if (restaurantDetail.categories.isEmpty) return SizedBox();

    return SliverPersistentHeader(
      pinned: true,
      delegate: _AppSliverPersistentHeaderDelegate(
        child: Container(
          color: Colors.white,
          child: ListView.separated(
            separatorBuilder: (context, index) => SizedBox(
              width: 14,
            ),
            scrollDirection: Axis.horizontal,
            itemCount: restaurantDetail.categories.length,
            padding: EdgeInsets.symmetric(horizontal: 10),
            itemBuilder: (context, index) => InkWell(
              onTap: () async {
                await autoScrollController.scrollToIndex(
                  index,
                  preferPosition: AutoScrollPosition.begin
                );
              },
              child: Center(
                child: Text(
                  restaurantDetail.categories.elementAt(index).categoryName,
                  style: TextStyle(fontWeight: FontWeight.bold),
                ),
              ),
            ),
          ),
        ),
      ),
    );
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
          SizedBox(
            height: 20,
          ),
          // ...restaurantDetail.categories
          //     .map((e) => AutoScrollTag(
          //         child: RestaurantDetailCategoryWidget(category: e)))
          //     .toList(),
          for (int i = 0; i < restaurantDetail.categories.length; i++)
            AutoScrollTag(
                index: i,
                key: ValueKey(i),
                controller: autoScrollController,
                child: RestaurantDetailCategoryWidget(
                    category: restaurantDetail.categories.elementAt(i)))
        ],
      ),
    );
  }
}

class _AppSliverPersistentHeaderDelegate
    extends SliverPersistentHeaderDelegate {
  Widget child;

  _AppSliverPersistentHeaderDelegate({@required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 56.0;

  @override
  double get minExtent => 56.0;

  @override
  bool shouldRebuild(covariant SliverPersistentHeaderDelegate oldDelegate) {
    return true;
  }
}
