import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/location_widget.dart';
import 'package:flutter_grigora/ui/components/notification/app_notification.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ApplicationBar extends AppBar {

  ApplicationBar({bool showBackButton, GlobalKey<ScaffoldState> scaffoldKey}) : super(
    leading: !showBackButton ? Padding(
      padding: const EdgeInsets.all(4.0),
      child: SvgPicture.asset("assets/images/grigora_logo.svg"),
    ) : null,
    title: LocationWidget(),
    centerTitle: true,
    backgroundColor: Colors.white,
    actions: [
      AppNotificationWidget(),
      IconButton(icon: Icon(Icons.menu), onPressed: (){
        scaffoldKey.currentState.openEndDrawer();
      })
    ]
  );
}
