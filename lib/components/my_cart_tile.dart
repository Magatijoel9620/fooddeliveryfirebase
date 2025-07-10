import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/components/my_quantity_selector.dart';
import 'package:food_delivery_firebase/models/restaurant.dart';
import 'package:provider/provider.dart';
import 'package:intl/intl.dart'; // For currency formatting

import '../models/cart_item.dart';

class MyCartTile extends StatelessWidget {
  final CartItem cartItem;

  const MyCartTile({super.key, required this.cartItem});

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    // Helper for currency formatting
    final currencyFormatter = NumberFormat.currency(
      locale: 'en_US', // Adjust to your locale
      symbol: '\$', // Adjust symbol
    );

    return Card(
      // Using Card for better elevation and a defined boundary
      margin: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      elevation: 2,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
      clipBehavior: Clip.antiAlias, // Ensures content respects card's rounded corners
      child: Padding(
        padding: const EdgeInsets.all(12.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Food Image
                ClipRRect(
                  borderRadius: BorderRadius.circular(8.0),
                  child: Image.asset(
                    cartItem.food.imagePath,
                    height: 80, // Slightly reduced for a more compact look
                    width: 80,
                    fit: BoxFit.cover,
                  ),
                ),
                const SizedBox(width: 12),

                // Name, Price, Quantity Selector
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        cartItem.food.name,
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                      ),
                      const SizedBox(height: 4),
                      Text(
                        currencyFormatter.format(cartItem.food.price),
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      QuantitySelector(
                        quantity: cartItem.quantity,
                        food: cartItem.food,
                        onDecrement: () {
                          // Consider adding a check: if quantity is 1 and decrement is pressed,
                          // maybe confirm removal or just remove directly.
                          Provider.of<Restaurant>(context, listen: false)
                              .removeFromCart(cartItem);
                        },
                        onIncrement: () {
                          Provider.of<Restaurant>(context, listen: false)
                              .addToCart(cartItem.food, cartItem.selectedAddons);
                        },
                      ),
                    ],
                  ),
                ),
                const SizedBox(width: 8),

                // Total Price for this item (Food price + Addons) * Quantity
                // This is a good place to show the subtotal for THIS cart item
                Text(
                  currencyFormatter.format(cartItem.totalPrice), // Assuming CartItem has a totalPrice getter
                  style: textTheme.titleMedium?.copyWith(
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                ),
              ],
            ),

            // Addons Display (if any)
            if (cartItem.selectedAddons.isNotEmpty) ...[
              const SizedBox(height: 10),
              Divider(color: colorScheme.outlineVariant, height: 1),
              const SizedBox(height: 10),
              Padding(
                padding: const EdgeInsets.only(left: 4.0), // Align with text content
                child: Text(
                  "Add-ons:",
                  style: textTheme.labelLarge?.copyWith(
                    color: colorScheme.onSurfaceVariant,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              const SizedBox(height: 6),
              Wrap( // Use Wrap for addons to flow to the next line if space is limited
                spacing: 8.0, // Horizontal space between chips
                runSpacing: 4.0, // Vertical space between lines of chips
                children: cartItem.selectedAddons.map((addon) {
                  return Chip(
                    label: Text(
                      '${addon.name} (+${currencyFormatter.format(addon.price)})',
                      style: textTheme.labelSmall?.copyWith(
                        color: colorScheme.onSecondaryContainer, // Ensure good contrast
                      ),
                    ),
                    backgroundColor: colorScheme.secondaryContainer,
                    padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 4),
                    materialTapTargetSize: MaterialTapTargetSize.shrinkWrap, // Reduces tap target size
                    shape: StadiumBorder(
                      // Optional: remove side border or use a more subtle one
                      // side: BorderSide(color: colorScheme.outline.withOpacity(0.5))
                    ),
                  );
                }).toList(),
              ),
            ],
          ],
        ),
      ),
    );
  }
}
