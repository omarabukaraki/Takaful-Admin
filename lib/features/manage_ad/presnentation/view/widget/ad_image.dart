import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class AdImage extends StatelessWidget {
  const AdImage({super.key, this.image});
  final String? image;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: double.infinity,
      child: CachedNetworkImage(
        imageUrl: image!,
        fit: BoxFit.fill,
        progressIndicatorBuilder: (context, url, downloadProgress) {
          return CircularProgressIndicator(value: downloadProgress.progress);
        },
        errorWidget: (context, url, error) => const Icon(Icons.error),
      ),
    );
  }
}
