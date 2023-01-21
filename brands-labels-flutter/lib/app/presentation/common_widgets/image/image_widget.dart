import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../../../theme/app_asset.dart';

class NetworkImageWidget extends StatelessWidget {
  final String? imageUrl;
  final double? height;
  final double? width;
  final Color? color;
  final BoxFit? fit;
  final BorderRadius? borderRadius;

  const NetworkImageWidget({
    Key? key,
    this.height,
    this.width,
    this.color,
    this.fit,
    this.imageUrl,
    this.borderRadius,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      fit: fit ?? BoxFit.cover,
      height: height,
      width: width,
      color: color,
      imageUrl: imageUrl!,
      progressIndicatorBuilder: (context, url, downloadProgress) =>
          Lottie.asset(
        AppAsset.loaderJson,
        height: 100,
        width: 100,
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
    );
  }
}
