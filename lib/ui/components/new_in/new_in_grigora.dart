import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Restaurant.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/ui/components/base/RestaurantSectionBase.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:provider/provider.dart';

class NewInGrigora extends StatefulWidget {
  @override
  _NewInGrigoraState createState() => _NewInGrigoraState();
}

class _NewInGrigoraState extends RestaurantBaseSection<NewInGrigora> {

  @override
  List<Restaurant> get items => context.read<AppViewModel>().restaurants;

  @override
  Axis get scrollDirection => Axis.horizontal;

  @override
  bool get showViewAllButton => true;

  @override
  String get subtitle => "Recently added vendors";

  @override
  DynamicHeading get heading => DynamicHeading(texts: [
    DynamicHeadingText(text: "New", textColor: AppColors.yellow),
    DynamicHeadingText(text: " in Grigora")
  ]);
}
