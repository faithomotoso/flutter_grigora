import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/network_image/network_image.dart';

class RestaurantDetailBg extends StatelessWidget {
  final String backgroundUrl;

  RestaurantDetailBg({@required this.backgroundUrl});

  @override
  Widget build(BuildContext context) {
    return Opacity(
        opacity: 0.7,
        child: SizedBox(
          width: MediaQuery.of(context).size.width,
          child: AppNetworkImage(
            imageUrl: backgroundUrl,
          ),
        ));
  }
}
