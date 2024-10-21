import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class ShimmerFeatured extends StatelessWidget {
  const ShimmerFeatured({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: size.height * 0.25,
      child: Shimmer.fromColors(
        baseColor: Colors.grey.shade300,
        highlightColor: Colors.white70,
        child: ListView.builder(
          physics: const BouncingScrollPhysics(),
          padding: const EdgeInsets.only(left: 12),
          scrollDirection: Axis.horizontal,
          itemCount: 5, // Placeholder count for skeletons
          itemBuilder: (context, index) {
            return Padding(
              padding: const EdgeInsets.symmetric(horizontal: 8),
              child: Container(
                width: size.width * 0.3, // Placeholder size
                decoration: BoxDecoration(
                  color: const Color.fromARGB(255, 233, 226, 226),
                  borderRadius: BorderRadius.circular(16),
                ),
              ),
            );
          },
        ),
      ),
    );
  }
}
