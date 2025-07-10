import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:food_delivery_firebase/models/restaurant.dart'; // Ensure this path is correct

class MyCurrentLocation extends StatelessWidget {
  const MyCurrentLocation({super.key});

  void openLocationSearchBox(BuildContext context) {
    final TextEditingController textController = TextEditingController();

    // Pre-fill the text field with the current address if available
    // This provides a better user experience for editing.
    textController.text = context.read<Restaurant>().deliveryAddress;

    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text("Update Delivery Location"), // More descriptive title
        content: TextField(
          controller: textController,
          decoration: const InputDecoration(
            hintText: "Enter new address...",
            labelText: "Delivery Address", // Added labelText
          ),
          autofocus: true, // Automatically focus the text field
        ),
        actions: [
          TextButton( // Using TextButton for modern styling
            onPressed: () => Navigator.pop(context),
            child: const Text("Cancel"),
          ),
          ElevatedButton( // Using ElevatedButton for the primary action
            onPressed: () {
              String newAddress = textController.text.trim(); // Trim whitespace
              if (newAddress.isNotEmpty) { // Only update if not empty
                context
                    .read<Restaurant>()
                    .updateDeliveryAddress(newAddress);
              }
              Navigator.pop(context);
              // textController.dispose(); // Dispose if controller is not needed afterwards,
              // but here it's local to the function.
              // No need to clear if disposing.
            },
            child: const Text("Save"),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      // Consider adjusting padding if it feels too large for a horizontal layout
      padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0),
      child: GestureDetector(
        onTap: () => openLocationSearchBox(context),
        // Use a MouseRegion to change cursor on web/desktop for better UX
        child: MouseRegion(
          cursor: SystemMouseCursors.click,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start, // Or MainAxisAlignment.center, etc.
            crossAxisAlignment: CrossAxisAlignment.center, // Vertically align items in the middle
            children: [
              // Optional: An icon to represent location
              Icon(
                Icons.location_on_outlined,
                color: Theme.of(context).colorScheme.primary,
                size: 20, // Adjust size as needed
              ),
              const SizedBox(width: 8), // Spacing between icon and text

              // "Deliver to:" text (or similar, more descriptive)
              Text(
                "Deliver to: ",
                style: TextStyle(
                  color: Theme.of(context).colorScheme.onSurfaceVariant, // A less prominent color
                  fontSize: 14,
                ),
              ),
const SizedBox(width: 15), // Spacing between text and address
              // Address - Use Expanded if the address can be long and you want it to take available space
              Expanded(
                child: Consumer<Restaurant>(
                  builder: (context, restaurant, child) => Text(
                    restaurant.deliveryAddress.isEmpty
                        ? "Tap to set address" // Placeholder if no address
                        : restaurant.deliveryAddress,
                    style: TextStyle(
                      color: Theme.of(context).colorScheme.inversePrimary,
                      fontWeight: FontWeight.bold,
                      fontSize: 14,
                    ),
                    overflow: TextOverflow.ellipsis, // Prevent long addresses from breaking layout
                    maxLines: 1, // Ensure it stays on one line
                  ),
                ),
              ),
              const SizedBox(width: 4), // Small spacing before the icon

              // Drop-down icon
              Icon(
                Icons.keyboard_arrow_down_rounded,
                color: Theme.of(context).colorScheme.inversePrimary,
                size: 24, // Adjust size
              ),
            ],
          ),
        ),
      ),
    );
  }
}
