import 'package:flutter/material.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';

class TileSubtitleText extends StatelessWidget {
  final String text;

  TileSubtitleText({@required this.text});

  @override
  Widget build(BuildContext context) {
    return Text(
      text,
      style: AppFontStyles.body1(context).copyWith(color: Colors.blueGrey),
    );
  }
}
