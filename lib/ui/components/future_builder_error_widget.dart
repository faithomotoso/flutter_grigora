import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/button/app_button.dart';
import 'package:flutter_grigora/ui/components/loading_indicator.dart';
import 'package:flutter_grigora/utils/app_font_styles.dart';
import 'package:flutter_grigora/utils/utils.dart';

class FutureBuilderErrorWidget extends StatelessWidget {
  final VoidCallback onRefresh;

  FutureBuilderErrorWidget({@required this.onRefresh});

  final Color grey = Colors.grey.withOpacity(0.7);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: bodyPadding,
      child: Center(
        child: SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.do_disturb_outlined,
                color: grey,
                size: 100,
              ),
              SizedBox(
                height: 10,
              ),
              Text(
                "An error occurred.\nCheck your internet connection then try refreshing this page, "
                "if the error persists please contact support.",
                textAlign: TextAlign.center,
                style: AppFontStyles.headline6(context).copyWith(color: grey),
              ),
              SizedBox(
                height: 5,
              ),
              AppButton(buttonText: "Reload", onTap: onRefresh?.call)
            ],
          ),
        ),
      ),
    );
  }
}
