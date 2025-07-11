// lib/components/my_button.dart
import 'package:flutter/material.dart';

class MyButton extends StatelessWidget {
  final Function()? onTap;
  final String text;
  final bool isLoading; // <<<--- NEW
  final Color? backgroundColor; // <<<--- NEW (Optional: for more customization)
  final Color? textColor; // <<<--- NEW (Optional: for more customization)
  final double? width; // <<<--- NEW (Optional: for specific width)

  const MyButton({
    super.key,
    required this.text,
    required this.onTap,
    this.isLoading = false, // <<<--- NEW: Default to false
    this.backgroundColor,
    this.textColor,
    this.width,
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;
    final bool isDisabled = onTap == null || isLoading;

    return GestureDetector(
      onTap: isDisabled ? null : onTap,
      child: Container(
        width: width, // Use specified width or let it expand/wrap
        padding: const EdgeInsets.symmetric(vertical: 16, horizontal: 25), // Adjusted padding
        margin: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 10.0), // Keep or manage in LoginPage
        decoration: BoxDecoration(
          color: isDisabled
              ? colorScheme.onSurface.withOpacity(0.12) // Standard disabled color
              : backgroundColor ?? colorScheme.primary, // Use provided color or theme primary
          borderRadius: BorderRadius.circular(12), // Slightly larger radius
          boxShadow: isDisabled ? [] : [ // Add a subtle shadow when enabled
            BoxShadow(
              color: (backgroundColor ?? colorScheme.primary).withOpacity(0.3),
              blurRadius: 8,
              offset: const Offset(0, 4),
            )
          ],
        ),
        child: Center(
          child: isLoading
              ? SizedBox(
            width: 24, // Consistent size for indicator
            height: 24,
            child: CircularProgressIndicator(
              color: textColor ?? colorScheme.onPrimary, // Use provided text color or theme onPrimary
              strokeWidth: 2.5,
            ),
          )
              : Text(
            text,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: isDisabled
                  ? colorScheme.onSurface.withOpacity(0.38) // Standard disabled text color
                  : textColor ?? colorScheme.onPrimary,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}
