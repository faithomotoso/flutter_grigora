import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:provider/provider.dart';

class LocationWidget extends StatefulWidget {
  @override
  _LocationWidgetState createState() => _LocationWidgetState();
}

class _LocationWidgetState extends State<LocationWidget> {
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(Icons.location_on_outlined),
          Text(
            context.watch<AppViewModel>().selectedLocation,
            overflow: TextOverflow.ellipsis,
            style: AppFontStyles.body1(context).copyWith(fontWeight: FontWeight.bold),
          ),
          Icon(Icons.keyboard_arrow_down)
        ],
      ),
    );
  }
}
