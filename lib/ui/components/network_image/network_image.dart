import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/loading_indicator.dart';

class AppNetworkImage extends CachedNetworkImage {
  final String imageUrl;

  AppNetworkImage({@required this.imageUrl})
      : super(
            imageUrl: imageUrl,
            progressIndicatorBuilder: (context, _, progress) =>
                LoadingIndicator());
}
