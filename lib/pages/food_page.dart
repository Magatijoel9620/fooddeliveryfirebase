import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/components/my_button.dart';
import 'package:food_delivery_firebase/models/restaurant.dart';
import 'package:provider/provider.dart';
import '../models/food.dart'; // Ensure this path is correct

class FoodPage extends StatefulWidget {
  final Food food;
  // No need to initialize selectedAddons here, do it in _FoodPageState.initState
  // final Map<Addon, bool> selectedAddons = {}; // Remove from here

  const FoodPage({super.key, required this.food});

  @override
  State<FoodPage> createState() => _FoodPageState();
}

class _FoodPageState extends State<FoodPage> {
  // Initialize selectedAddons in initState
  late Map<Addon, bool> _selectedAddons;

  @override
  void initState() {
    super.initState();
    _selectedAddons = {}; // Initialize here
    for (Addon addon in widget.food.availableAddons) {
      _selectedAddons[addon] = false;
    }
  }

  void addToCart() { // Removed parameters, use widget.food and _selectedAddons
    // format selected addons
    List<Addon> currentlySelectedAddons = [];
    for (Addon addon in widget.food.availableAddons) {
      if (_selectedAddons[addon] == true) {
        currentlySelectedAddons.add(addon);
      }
    }
    //add to cart
    context.read<Restaurant>().addToCart(widget.food, currentlySelectedAddons);

    // Optionally, show a confirmation SnackBar
    ScaffoldMessenger.of(context).showSnackBar(
      SnackBar(
        content: Text("${widget.food.name} added to cart!"),
        duration: const Duration(seconds: 2),
        backgroundColor: Theme.of(context).colorScheme.primary,
      ),
    );

    // Close the current food page to menu
    // Consider if this is always the desired behavior.
    // Sometimes users might want to add multiple items or adjust quantity.
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final colorScheme = theme.colorScheme;

    return Scaffold(
      // Using a Stack to place content over the image or create effects
      body: Stack(
        children: [
          // 1. Background Image (Could be part of a SliverAppBar for parallax)
          // For simplicity, a basic image at the top.
          // You could wrap this with Hero for a transition
          Positioned(
            top: 0,
            left: 0,
            right: 0,
            child: Hero(
              tag: 'food_image_${widget.food.name}', // Unique tag
              child: Image.asset(
                widget.food.imagePath,
                fit: BoxFit.cover,
                height: MediaQuery.of(context).size.height * 0.4, // Adjust height
                // Add a gradient overlay for text readability if text goes over image
                // child: Container(
                //   decoration: BoxDecoration(
                //     gradient: LinearGradient(
                //       colors: [Colors.black.withOpacity(0.5), Colors.transparent],
                //       begin: Alignment.topCenter,
                //       end: Alignment.bottomCenter,
                //     ),
                //   ),
                // ),
              ),
            ),
          ),

          // 2. Custom Back Button (Overlayed on image or content area)
          Positioned(
            top: MediaQuery.of(context).padding.top + 10, // Adjust for status bar
            left: 15,
            child: Container(
              decoration: BoxDecoration(
                color: colorScheme.surface.withOpacity(0.7), // Semi-transparent background
                shape: BoxShape.circle,
              ),
              child: IconButton(
                icon: Icon(Icons.arrow_back_ios_rounded, color: colorScheme.onSurface),
                onPressed: () => Navigator.pop(context),
                tooltip: 'Back to menu',
              ),
            ),
          ),

          // 3. Scrollable Content Area
          // DraggableScrollableSheet for content that slides up
          DraggableScrollableSheet(
            initialChildSize: 0.65, // Start from 65% of screen height
            minChildSize: 0.65,     // Minimum height
            maxChildSize: 0.9,      // Maximum height when dragged up
            builder: (BuildContext context, ScrollController scrollController) {
              return Container(
                decoration: BoxDecoration(
                  color: colorScheme.surface,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(24.0),
                    topRight: Radius.circular(24.0),
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: Colors.black.withOpacity(0.1),
                      blurRadius: 10,
                      spreadRadius: 5,
                    ),
                  ],
                ),
                child: SingleChildScrollView(
                  controller: scrollController,
                  padding: const EdgeInsets.fromLTRB(25.0, 25.0, 25.0, 100.0), // Padding for content and bottom button
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      // Food Name
                      Text(
                        widget.food.name,
                        style: textTheme.headlineSmall?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 8),

                      // Food Price
                      Text(
                        '\$${widget.food.price.toStringAsFixed(2)}',
                        style: textTheme.titleLarge?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.primary,
                        ),
                      ),
                      const SizedBox(height: 16),

                      // Food Description
                      Text(
                        widget.food.description,
                        style: textTheme.bodyMedium?.copyWith(
                          color: colorScheme.onSurfaceVariant,
                          fontSize: 15,
                          height: 1.4, // Line height for readability
                        ),
                      ),
                      const SizedBox(height: 20),

                      Divider(color: colorScheme.outlineVariant),
                      const SizedBox(height: 20),

                      // Add-ons Section
                      Text(
                        "Add-ons",
                        style: textTheme.titleMedium?.copyWith(
                          fontWeight: FontWeight.bold,
                          color: colorScheme.onSurface,
                        ),
                      ),
                      const SizedBox(height: 12),

                      // Addons List (Improved styling)
                      if (widget.food.availableAddons.isNotEmpty)
                        Container(
                          decoration: BoxDecoration(
                            // Optional: border or different background for addons section
                            // border: Border.all(color: colorScheme.outlineVariant),
                            // borderRadius: BorderRadius.circular(12),
                          ),
                          child: ListView.builder(
                            shrinkWrap: true,
                            physics: const NeverScrollableScrollPhysics(),
                            itemCount: widget.food.availableAddons.length,
                            itemBuilder: (context, index) {
                              Addon addon = widget.food.availableAddons[index];
                              return CheckboxListTile(
                                title: Text(addon.name, style: textTheme.titleSmall?.copyWith(color: colorScheme.onSurface)),
                                subtitle: Text(
                                  '\$${addon.price.toStringAsFixed(2)}',
                                  style: textTheme.bodyMedium?.copyWith(color: colorScheme.primary),
                                ),
                                value: _selectedAddons[addon],
                                onChanged: (bool? value) {
                                  setState(() {
                                    _selectedAddons[addon] = value!;
                                  });
                                },
                                activeColor: colorScheme.primary,
                                controlAffinity: ListTileControlAffinity.leading, // Checkbox on the left
                                contentPadding: const EdgeInsets.symmetric(horizontal: 0, vertical: 4),
                              );
                            },
                          ),
                        )
                      else
                        Text(
                          "No add-ons available for this item.",
                          style: textTheme.bodyMedium?.copyWith(color: colorScheme.onSurfaceVariant),
                        ),
                      const SizedBox(height: 30), // Extra space before button might be pushed up
                    ],
                  ),
                ),
              );
            },
          ),

          // 4. Sticky "Add to Cart" Button at the bottom
          Positioned(
            left: 0,
            right: 0,
            bottom: 0,
            child: Container(
              padding: const EdgeInsets.only(left: 25, right: 25, bottom: 25, top: 10),
              decoration: BoxDecoration(
                  color: colorScheme.surface, // Match draggable sheet or be distinct
                  boxShadow: [ // Optional: shadow to lift button
                    BoxShadow(
                      color: Colors.black.withOpacity(0.05),
                      blurRadius: 8,
                      offset: const Offset(0, -3),
                    )
                  ]
              ),
              child: MyButton(
                onTap: addToCart,
                text: "Add To Cart",
              ),
            ),
          ),
        ],
      ),
    );
  }
}
