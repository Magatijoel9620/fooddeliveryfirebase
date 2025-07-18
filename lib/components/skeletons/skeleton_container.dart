// lib/components/skeletons/skeleton_container.dart
import 'package:flutter/material.dart';

class SkeletonContainer extends StatelessWidget {
  final double width;
  final double height;
  final BorderRadiusGeometry borderRadius;

  const SkeletonContainer({
    super.key,
    required this.width,
    required this.height,
    this.borderRadius = const BorderRadius.all(Radius.circular(4)),
  });

  const SkeletonContainer.circular({
    super.key,
    required double diameter,
    // ignore: unused_element
    BorderRadiusGeometry? borderRadius,
  })  : width = diameter,
        height = diameter,
        borderRadius = const BorderRadius.all(Radius.circular(100)); // Make it a circle

  const SkeletonContainer.square({
    super.key,
    required double size,
    // ignore: unused_element
    BorderRadiusGeometry? borderRadius,
  }) : width = size,
        height = size,
        borderRadius = const BorderRadius.all(Radius.circular(4));


  @override
  Widget build(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Colors.grey[300], // Or use Theme.of(context).colorScheme.surfaceVariant
        borderRadius: borderRadius,
      ),
    );
  }
}
   