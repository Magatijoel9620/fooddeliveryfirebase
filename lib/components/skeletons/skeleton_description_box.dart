// lib/components/skeletons/skeleton_description_box.dart
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'skeleton_container.dart';

class SkeletonDescriptionBox extends StatelessWidget {
  const SkeletonDescriptionBox({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0),
        padding: const EdgeInsets.all(16.0),
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey[350]!),
          borderRadius: BorderRadius.circular(8),
        ),
        child: const Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonContainer(width: 80, height: 14),
                SizedBox(height: 4),
                SkeletonContainer(width: 100, height: 12),
              ],
            ),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SkeletonContainer(width: 80, height: 14),
                SizedBox(height: 4),
                SkeletonContainer(width: 100, height: 12),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
