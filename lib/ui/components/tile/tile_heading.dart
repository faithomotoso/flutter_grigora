import 'package:flutter/material.dart';

import '../button/app_button.dart';

class TileHeading extends StatelessWidget {
  // For tiles in homepage and restaurant detail
  final Widget title;
  final Widget subtitle;
  final bool showViewAllButton;
  final VoidCallback onViewAllTapped;

  TileHeading(
      {@required this.title,
      this.subtitle,
      this.showViewAllButton = true,
      this.onViewAllTapped});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Expanded(
          child: Column(
            mainAxisSize: MainAxisSize.min,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              title,
              SizedBox(height: 6,),
              subtitle
            ],
          ),
        ),
        if (showViewAllButton) Center(
          child: ViewAllButton(
            onTap: onViewAllTapped?.call,
          ),
        )
      ],
    );
  }
}
