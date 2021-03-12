import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/business_logic/view_models/AppViewModel.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:provider/provider.dart';

class AppNotificationWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        notificationCount(context),
        Icon(CupertinoIcons.bell),
      ],
    );
  }

  Widget notificationCount(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.red,
        borderRadius: BorderRadius.circular(4)
      ),
      padding: EdgeInsets.symmetric(vertical: 2, horizontal: 6),
      child: Center(child: Text(
        context.watch<AppViewModel>().notificationCount.toString(),
        style: TextStyle(
          color: Colors.white
        ),
      )),
    );
  }
}
