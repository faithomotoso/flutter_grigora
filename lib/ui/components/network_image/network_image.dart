import 'dart:typed_data';

import 'dart:ui';

import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_grigora/ui/components/loading_indicator.dart';

class AppNetworkImage extends CachedNetworkImage {
  final String imageUrl;
  final BoxFit fit;

  AppNetworkImage({@required this.imageUrl, this.fit = BoxFit.contain})
      : super(
            imageUrl: imageUrl,
            fit: BoxFit.contain,
            progressIndicatorBuilder: (context, _, progress) =>
                LoadingIndicator(),
            errorWidget: (context, _, error) => Center(
                  child: Icon(
                    Icons.broken_image_rounded,
                    color: Colors.grey,
                  ),
                ));
}
