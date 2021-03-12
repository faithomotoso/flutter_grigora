import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/models/Cuisine.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/ui/components/cuisines/cuisine_tile.dart';
import 'package:flutter_grigora/utils/utils.dart';
import 'package:provider/provider.dart';

class CuisinesListWidget extends StatefulWidget {
  @override
  _CuisinesListWidgetState createState() => _CuisinesListWidgetState();
}

class _CuisinesListWidgetState extends State<CuisinesListWidget> {
  @override
  Widget build(BuildContext context) {
    List<Cuisine> cuisines = context.read<AppViewModel>().cuisines;

    return SizedBox(
      height: 90,
      child: ListView.separated(
        separatorBuilder: (context, index) => SizedBox(
          width: 20,
        ),
        physics: BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        padding: bodyPadding,
        itemCount: cuisines.length,
        itemBuilder: (context, index) => CuisineTile(
          cuisine: cuisines.elementAt(index),
          onCuisineTapped: (cuisine) {},
        ),
      ),
    );
  }
}
