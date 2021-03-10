import 'package:flutter/material.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:flutter_grigora/utils/colors.dart';

class AppButton extends StatelessWidget {
  final String buttonText;
  final VoidCallback onTap;
  final Color textColor;
  final Color buttonColor;

  AppButton(
      {@required this.buttonText,
      @required this.onTap,
      this.textColor = Colors.white,
      this.buttonColor = AppColors.red});

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
        onPressed: onTap?.call,
        child: Text(
          buttonText,
          style: AppFontStyles.body1(context)
              .copyWith(color: textColor, fontWeight: FontWeight.bold),
        ),
    style: ButtonStyle(
      backgroundColor: MaterialStateProperty.all<Color>(buttonColor,)
    ),);
  }
}
