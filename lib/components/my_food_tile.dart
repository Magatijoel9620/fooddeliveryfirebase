import 'package:flutter/material.dart';
import '../models/food.dart'; // Ensure this path is correct

class FoodTile extends StatelessWidget {
  final Food food;
  final void Function()? onTap;

  const FoodTile({
    super.key,
    required this.food,
    this.onTap, // Made onTap optional as not all tiles might be tappable
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context); // Cache theme for easier access

    return Column(
      mainAxisSize: MainAxisSize.min, // To make the Column wrap its content
      children: [
        InkWell( // Use InkWell for Material ripple effect on tap
          onTap: onTap,
          borderRadius: BorderRadius.circular(12), // Match Card's border radius for ripple
          child: Card( // Wrap with Card for elevation and defined boundary
            margin: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 8.0),
            elevation: 2.0, // Subtle elevation
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(12.0),
            ),
            clipBehavior: Clip.antiAlias, // Ensures content respects card's rounded corners
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.start, // Align items to the top
                children: [
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          food.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: theme.colorScheme.onSurface,
                          ),
                        ),
                        const SizedBox(height: 4),
                        Text(
                          '\$${food.price.toStringAsFixed(2)}', // Format price to 2 decimal places
                          style: theme.textTheme.titleSmall?.copyWith(
                            color: theme.colorScheme.primary,
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        const SizedBox(height: 8),
                        Text(
                          food.description,
                          style: theme.textTheme.bodyMedium?.copyWith(
                            color: theme.colorScheme.onSurfaceVariant,
                          ),
                          maxLines: 2, // Limit description to 2 lines
                          overflow: TextOverflow.ellipsis, // Add ellipsis if too long
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 16), // Spacing between text and image

                  // Food image
                  SizedBox( // Constrain image size
                    width: 100,
                    height: 100,
                    child: ClipRRect(
                      borderRadius: BorderRadius.circular(8.0),
                      child: Image.asset(
                        food.imagePath,
                        fit: BoxFit.cover, // Ensure the image covers the box
                        // Optional: Add a placeholder and error widget for the image
                        // loadingBuilder: (BuildContext context, Widget child, ImageChunkEvent? loadingProgress) {
                        //   if (loadingProgress == null) return child;
                        //   return Center(
                        //     child: CircularProgressIndicator(
                        //       value: loadingProgress.expectedTotalBytes != null
                        //           ? loadingProgress.cumulativeBytesLoaded / loadingProgress.expectedTotalBytes!
                        //           : null,
                        //     ),
                        //   );
                        // },
                        // errorBuilder: (BuildContext context, Object error, StackTrace? stackTrace) {
                        //   return Container(
                        //     color: Colors.grey[300],
                        //     child: Icon(Icons.broken_image, color: Colors.grey[600], size: 40),
                        //   );
                        // },
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
        // Optional Divider: You might not need this if using Cards,
        // as cards themselves provide visual separation.
        // If you still want it, keep it outside the InkWell/Card.
        // Padding(
        //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
        //   child: Divider(
        //     color: theme.colorScheme.outlineVariant, // Use a more subtle color
        //     height: 1, // Standard height for divider
        //   ),
        // )
      ],
    );
  }
}

