import 'package:flutter/material.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';

/// Text with possible different text styles, using RichText

class DynamicHeading extends StatelessWidget {
  final List<DynamicHeadingText> texts;

  DynamicHeading({@required this.texts});

  @override
  Widget build(BuildContext context) {
    return RichText(text: TextSpan(
        text: "",
        style: AppFontStyles.headline6Bold(context),
        children: texts
    ),);
  }
}

class DynamicHeadingText extends TextSpan {
  final String text;

  // Using only color as that's the only thing that changes
  final Color textColor;

  DynamicHeadingText({@required this.text, this.textColor}) : super(
      text: text,
      style: TextStyle(color: textColor)
  );
}


