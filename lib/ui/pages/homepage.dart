import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/ui/components/app_future_builder.dart';
import 'package:flutter_grigora/ui/components/promotions/ongoing_promotions_widget.dart';
import 'package:flutter_grigora/ui/components/scaffold/app_scaffold.dart';
import 'package:provider/provider.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future homePageFuture;

  @override
  void initState() {
    super.initState();
    fetchHomePageApi();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.white,
      child: AppFutureBuilder(
          future: homePageFuture,
          onRefresh: () {
            setState(() {
              fetchHomePageApi();
            });
          },
          child: AppScaffold(
            child: Column(
              children: [Expanded(
                  flex: 1,
                  child: OngoingPromotionsWidget()),
              Expanded(flex: 2, child: SizedBox(),)],
            ),
          )),
    );
  }

  void fetchHomePageApi() {
    homePageFuture =
        Provider.of<AppViewModel>(context, listen: false).fetchHomePage();
  }
}
