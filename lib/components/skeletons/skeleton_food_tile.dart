// lib/components/skeletons/skeleton_food_tile.dart
import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'skeleton_container.dart';

class SkeletonFoodTile extends StatelessWidget {
  const SkeletonFoodTile({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey[300]!,
      highlightColor: Colors.grey[100]!,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
        padding: const EdgeInsets.all(12.0),
        decoration: BoxDecoration(
          color: Colors.white, // Placeholder background
          borderRadius: BorderRadius.circular(12),
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.1),
              spreadRadius: 1,
              blurRadius: 3,
              offset: const Offset(0, 2),
            ),
          ],
        ),
        child: Row(
          children: [
            const SkeletonContainer.square(size: 80), // For image
            const SizedBox(width: 16),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const SkeletonContainer(width: double.infinity, height: 16),
                  const SizedBox(height: 8),
                  SkeletonContainer(width: MediaQuery.of(context).size.width * 0.4, height: 14),
                  const SizedBox(height: 8),
                  const SkeletonContainer(width: 60, height: 20), // For price
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
   