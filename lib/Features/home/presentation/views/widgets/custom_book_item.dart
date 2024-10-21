import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CustomBookItem extends StatelessWidget {
  const CustomBookItem({
    super.key,
    required this.size,
    required this.radius,
    required this.imageurl,
  });
  final String imageurl;
  final Size size;
  final double radius;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: ClipRRect(
        borderRadius: BorderRadius.circular(16),
        child: AspectRatio(
            aspectRatio: 2 / 3,
            child: CachedNetworkImage(
              errorWidget: (context, url, error) => Icon(Icons.error),
              imageUrl: imageurl,
              fit: BoxFit.fill,
            )),
      ),
    );
  }
}
