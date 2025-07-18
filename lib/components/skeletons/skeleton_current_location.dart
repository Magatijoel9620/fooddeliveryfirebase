// lib/components/skeletons/skeleton_current_location.dart
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'skeleton_container.dart';

class SkeletonCurrentLocation extends StatelessWidget {
  const SkeletonCurrentLocation({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: const Padding(
        padding: EdgeInsets.symmetric(vertical: 8.0, horizontal: 25.0),
        child: Row(
          children: [
            SkeletonContainer.circular(diameter: 16), // Icon placeholder
            SizedBox(width: 8),
            SkeletonContainer(width: 150, height: 16), // Text placeholder
          ],
        ),
      ),
    );
  }
}