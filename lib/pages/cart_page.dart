import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/components/my_button.dart';
import 'package:food_delivery_firebase/components/my_cart_tile.dart';
import 'package:food_delivery_firebase/models/cart_item.dart';
import 'package:food_delivery_firebase/pages/payment_page.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_firebase/models/restaurant.dart';
import 'package:intl/intl.dart';
import 'package:flutter_slidable/flutter_slidable.dart'; // <<<--- ADD THIS IMPORT

class CartPage extends StatelessWidget {
  const CartPage({super.key});

  // Helper method to show delete confirmation (NEW)
  void _confirmDeleteItem(BuildContext context, Restaurant restaurant, CartItem cartItem, ColorScheme colorScheme, TextTheme textTheme) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
        title: Text("Remove Item?", style: textTheme.titleLarge),
        content: Text(
            "Are you sure you want to remove ${cartItem.food.name} from your cart?"),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: Text("Cancel", style: TextStyle(color: colorScheme.primary)),
          ),
          TextButton(
            onPressed: () {
              Navigator.pop(context);
              // Ensure you have a 'removeFromCart' method in your Restaurant model
              // that takes a CartItem and removes it.
              restaurant.removeFromCart(cartItem);
            },
            child: Text("Yes, Remove", style: TextStyle(color: colorScheme.error)),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final textTheme = theme.textTheme;

    final currencyFormatter = NumberFormat.currency(
      locale: 'en_US',
      symbol: '\$',
    );

    return Consumer<Restaurant>(
      builder: (context, restaurant, child) {
        final userCart = restaurant.cart;

        // --- IMPORTANT: Centralize these calculations in your Restaurant model ---
        // For example:
        // double subtotal = restaurant.subtotal;
        // double deliveryFee = restaurant.deliveryFee;
        // double totalAmount = restaurant.totalAmount;
        //
        // For now, using the local calculation you had:
        double subtotal = 0;
        if (userCart.isNotEmpty) {
          subtotal = userCart.fold(0.0, (sum, item) => sum + item.totalPrice);
        }
        const double deliveryFee = 5.00; // Example: This should ideally come from restaurant settings
        double totalAmount = subtotal + deliveryFee;
        // --- END OF IMPORTANT NOTE ---

        return Scaffold(
          appBar: AppBar(
            title: Text(
              "My Cart",
              style: TextStyle(color: colorScheme.onPrimaryContainer),
            ),
            backgroundColor: colorScheme.primaryContainer,
            foregroundColor: colorScheme.onPrimaryContainer,
            elevation: 1,
            actions: [
              if (userCart.isNotEmpty)
                IconButton(
                  tooltip: 'Clear Cart',
                  onPressed: () {
                    showDialog(
                      context: context,
                      builder: (context) => AlertDialog(
                        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(16)),
                        title: Text("Clear Cart?", style: textTheme.titleLarge),
                        content: const Text(
                            "Are you sure you want to remove all items from your cart?"),
                        actions: [
                          TextButton(
                            onPressed: () => Navigator.pop(context),
                            child: Text("Cancel", style: TextStyle(color: colorScheme.primary)),
                          ),
                          TextButton(
                            onPressed: () {
                              Navigator.pop(context);
                              restaurant.clearCart();
                            },
                            child: Text("Yes, Clear", style: TextStyle(color: colorScheme.error)),
                          ),
                        ],
                      ),
                    );
                  },
                  icon: const Icon(Icons.delete_outline_rounded),
                ),
            ],
          ),
          body: Column(
            children: [
              Expanded(
                child: userCart.isEmpty
                    ? _buildEmptyCartView(context, textTheme, colorScheme)
                    : ListView.builder(
                  padding: const EdgeInsets.only(top: 8, bottom: 8),
                  itemCount: userCart.length,
                  itemBuilder: (context, index) {
                    final cartItem = userCart[index];
                    // --- WRAP MyCartTile WITH Slidable ---
                    return Slidable(
                      key: ValueKey(cartItem), // Use cartItem itself or a unique ID if it has one
                      endActionPane: ActionPane(
                        motion: const StretchMotion(),
                        children: [
                          SlidableAction(
                            onPressed: (contextSlidable) { // Use a different context name if needed
                              _confirmDeleteItem(context, restaurant, cartItem, colorScheme, textTheme);
                            },
                            backgroundColor: colorScheme.error,
                            foregroundColor: colorScheme.onError,
                            icon: Icons.delete_sweep_rounded,
                            label: 'Delete',
                            borderRadius: BorderRadius.circular(12),
                          ),
                        ],
                      ),
                      child: MyCartTile(cartItem: cartItem),
                    );
                    // --- END OF Slidable WRAPPER ---
                  },
                ),
              ),
              if (userCart.isNotEmpty)
                _buildCheckoutSection(
                  context,
                  subtotal,
                  deliveryFee,
                  totalAmount,
                  currencyFormatter,
                  textTheme,
                  colorScheme,
                ),
            ],
          ),
        );
      },
    );
  }

  Widget _buildEmptyCartView(
      BuildContext context, TextTheme textTheme, ColorScheme colorScheme) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Icon(
            Icons.shopping_cart_outlined,
            size: 80,
            color: colorScheme.primary.withOpacity(0.7),
          ),
          const SizedBox(height: 20),
          Text(
            'Your Cart is Empty',
            style: textTheme.headlineSmall?.copyWith(color: colorScheme.onSurface),
          ),
          const SizedBox(height: 8),
          Text(
            'Looks like you haven\'t added anything to your cart yet.',
            textAlign: TextAlign.center,
            style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
          ),
          const SizedBox(height: 24),
          ElevatedButton.icon(
            icon: const Icon(Icons.storefront_outlined),
            label: const Text('Start Shopping'),
            style: ElevatedButton.styleFrom(
              backgroundColor: colorScheme.primary,
              foregroundColor: colorScheme.onPrimary,
              padding: const EdgeInsets.symmetric(horizontal: 24, vertical: 12),
              textStyle: textTheme.labelLarge,
            ),
            onPressed: () {
              Navigator.of(context).popUntil((route) => route.isFirst);
            },
          )
        ],
      ),
    );
  }

  Widget _buildCheckoutSection(
      BuildContext context,
      double subtotal,
      double deliveryFee,
      double totalAmount,
      NumberFormat currencyFormatter,
      TextTheme textTheme,
      ColorScheme colorScheme,
      ) {
    return Container(
      padding: const EdgeInsets.all(16.0),
      decoration: BoxDecoration(
          color: colorScheme.surfaceVariant.withOpacity(0.3),
          boxShadow: [
            BoxShadow(
              color: Colors.black.withOpacity(0.05),
              blurRadius: 10,
              offset: const Offset(0, -5),
            )
          ],
          borderRadius: const BorderRadius.only(
            topLeft: Radius.circular(20),
            topRight: Radius.circular(20),
          )),
      child: Column(
        mainAxisSize: MainAxisSize.min,
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          Text("Order Summary", style: textTheme.titleLarge?.copyWith(fontWeight: FontWeight.bold)),
          const SizedBox(height: 12),
          _buildSummaryRow("Subtotal", currencyFormatter.format(subtotal), textTheme),
          const SizedBox(height: 6),
          _buildSummaryRow("Delivery Fee", currencyFormatter.format(deliveryFee), textTheme),
          Divider(height: 24, color: colorScheme.outlineVariant),
          _buildSummaryRow(
            "Total Amount",
            currencyFormatter.format(totalAmount),
            textTheme,
            isTotal: true,
          ),
          const SizedBox(height: 20),
          MyButton(
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => const PaymentPage()),
              );
            },
            text: "Proceed to Checkout",
          ),
          const SizedBox(height: 8),
        ],
      ),
    );
  }

  Widget _buildSummaryRow(String label, String value, TextTheme textTheme, {bool isTotal = false}) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text(
          label,
          style: isTotal
              ? textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
              : textTheme.bodyLarge,
        ),
        Text(
          value,
          style: isTotal
              ? textTheme.titleMedium?.copyWith(fontWeight: FontWeight.bold)
              : textTheme.bodyLarge,
        ),
      ],
    );
  }
}
