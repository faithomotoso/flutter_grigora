import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/text/dynamic_heading.dart';
import 'package:flutter_grigora/ui/components/tile/tile_subtitle_text.dart';
import 'file:///C:/Users/user/AndroidStudioProjects/flutter_grigora/lib/ui/components/tile/tile_heading.dart';
import 'package:flutter_grigora/utils/colors.dart';
import 'package:flutter_grigora/utils/utils.dart';
import 'package:provider/provider.dart';

class NewInGrigora extends StatefulWidget {
  @override
  _NewInGrigoraState createState() => _NewInGrigoraState();
}

class _NewInGrigoraState extends State<NewInGrigora> {
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 200,
      child: Column(
        children: [
          heading(),
        ],
      ),
    );
  }

  Widget heading() {
    return Padding(
      padding: bodyPadding,
      child: TileHeading(
        title: DynamicHeading(texts: [
          DynamicHeadingText(text: "New", textColor: AppColors.yellow),
          DynamicHeadingText(text: " in Grigora")
        ]),
        subtitle: TileSubtitleText(
          text: "Recently added vendors",
        ),
      ),
    );
  }
}
