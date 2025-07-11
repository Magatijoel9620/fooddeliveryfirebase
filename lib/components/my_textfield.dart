// lib/components/my_textfield.dart
import 'package:flutter/material.dart';

class MyTextField extends StatelessWidget {
  final TextEditingController controller;
  final String hintText;
  final bool obscureText;
  final IconData? prefixIcon; // <<<--- NEW
  final TextInputType? keyboardType; // <<<--- NEW
  final String? Function(String?)? validator; // <<<--- NEW
  final FocusNode? focusNode; // <<<--- NEW (Optional, but good for focus management)
  final Function(String)? onChanged; // <<<--- NEW (Optional, if you need live changes)

  const MyTextField({
    super.key,
    required this.controller,
    required this.hintText,
    required this.obscureText,
    this.prefixIcon, // <<<--- NEW
    this.keyboardType, // <<<--- NEW
    this.validator, // <<<--- NEW
    this.focusNode, // <<<--- NEW
    this.onChanged, // <<<--- NEW
  });

  @override
  Widget build(BuildContext context) {
    final colorScheme = Theme.of(context).colorScheme;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 25.0), // You can keep this or manage padding in the LoginPage
      child: TextFormField( // <<<--- CHANGED from TextField to TextFormField for validation
        controller: controller,
        obscureText: obscureText,
        keyboardType: keyboardType,
        validator: validator,
        focusNode: focusNode,
        onChanged: onChanged,
        style: TextStyle(color: colorScheme.onSurface), // Text color when typing
        decoration: InputDecoration(
          prefixIcon: prefixIcon != null
              ? Icon(prefixIcon, color: colorScheme.onSurfaceVariant)
              : null,
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.outline), // Use outline color from theme
            borderRadius: BorderRadius.circular(12), // Consistent border radius
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(color: colorScheme.primary, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          errorBorder: OutlineInputBorder( // Style for validation error
            borderSide: BorderSide(color: colorScheme.error, width: 1.5),
            borderRadius: BorderRadius.circular(12),
          ),
          focusedErrorBorder: OutlineInputBorder( // Style for validation error when focused
            borderSide: BorderSide(color: colorScheme.error, width: 2),
            borderRadius: BorderRadius.circular(12),
          ),
          fillColor: colorScheme.surfaceVariant.withOpacity(0.3), // Subtle background
          filled: true,
          hintText: hintText,
          hintStyle: TextStyle(color: colorScheme.onSurfaceVariant.withOpacity(0.7)), // Softer hint text color
        ),
      ),
    );
  }
}
