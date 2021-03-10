import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/app_bar/app_bar.dart';

class AppScaffold extends StatefulWidget {
  final Widget child;

  AppScaffold({@required this.child});

  @override
  _AppScaffoldState createState() => _AppScaffoldState();
}

class _AppScaffoldState extends State<AppScaffold> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: ApplicationBar(),
      body: widget.child,
    );
  }
}
