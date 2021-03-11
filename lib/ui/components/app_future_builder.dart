import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/future_builder_error_widget.dart';
import 'package:flutter_grigora/ui/components/loading_indicator.dart';

class AppFutureBuilder extends StatefulWidget {
  final Future future;
  final VoidCallback onRefresh;
  final Widget child;

  AppFutureBuilder(
      {@required this.future, @required this.onRefresh, @required this.child});

  @override
  _AppFutureBuilderState createState() => _AppFutureBuilderState();
}

class _AppFutureBuilderState extends State<AppFutureBuilder> {
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: widget.future,
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting)
          return LoadingIndicatorWithLogo();

        if (snapshot.hasError) {
          if (kDebugMode) print(snapshot);
          return FutureBuilderErrorWidget(onRefresh: widget.onRefresh?.call);
        }

        return widget.child;
      },
    );
  }
}
