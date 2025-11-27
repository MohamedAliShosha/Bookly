import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookImage extends StatelessWidget {
  const CustomBookImage({super.key, required this.image});

  final String? image;

  @override
  Widget build(BuildContext context) {
    if (image == null) {
      return AspectRatio(
        aspectRatio: 2.6 / 4,
        child: Container(color: Colors.grey.shade200),
      );
    }

    return AspectRatio(
      aspectRatio: 2.6 / 4,
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: CachedNetworkImage(
          imageUrl: image!,
          fit: BoxFit.fill,
          placeholder: (context, url) =>
              const Center(child: CircularProgressIndicator()),
          errorWidget: (context, url, error) =>
              Container(color: Colors.grey.shade200),
        ),
      ),
    );
  }
}
