import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class LoadingIndicator extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: CircularProgressIndicator(),
    );
  }
}


class LoadingIndicatorWithLogo extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          SvgPicture.asset("assets/images/grigora_logo.svg", height: 80,),
          SizedBox(height: 10,),
          LoadingIndicator()
        ],
      ),
    );
  }
}

