import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/app_bar/app_bar.dart';
import 'package:flutter_grigora/ui/components/drawer/app_drawer.dart';

class AppScaffold extends StatefulWidget {
  final Widget child;
  final bool showBackButton;

  AppScaffold({@required this.child, this.showBackButton});

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationBar(showBackButton: widget.showBackButton ?? false, scaffoldKey: scaffoldKey),
      body: widget.child,
      key: scaffoldKey,
      endDrawer: AppDrawer(),
    );
  }
}
