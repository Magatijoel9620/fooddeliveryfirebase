import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/models/food.dart'; // Make sure Food and FoodCategory are defined here
import 'package:intl/intl.dart';

import 'cart_item.dart'; // Make sure CartItem is defined here

class Restaurant extends ChangeNotifier {
  // Original list of food menu (will be populated after "loading")
  final List<Food> _fullMenuData = [
    //burger e.g bacon burger| cheese burger| vegie burger|
    Food(
      name: "Classic cheese burger",
      description:
      "A juicy beef party with melted cheder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/burger.jpg", // Ensure these paths are correct in your pubspec.yaml
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(
          name: "Extra cheese",
          price: 0.99,
        ),
        Addon(
          name: "Bacon",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Classic Bacon burger",
      description:
      "A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/hamburger.png",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(
          name: "Extra cheese",
          price: 0.99,
        ),
        Addon(
          name: "Bacon",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Pancakes",
      description:
      "Fluffy pancakes served with syrup and butter.", // More relevant description
      imagePath: "assets/images/pancakes.jpg",
      price: 6.50,
      category: FoodCategory.desserts, // Changed category
      availableAddons: [
        Addon(
          name: "Blueberries",
          price: 0.99,
        ),
        Addon(
          name: "Chocolate Chips",
          price: 1.50,
        ),
        Addon(
          name: "Whipped Cream",
          price: 0.75,
        ),
      ],
    ),
    Food(
      name: "Ramen",
      description:
      "Rich pork broth with noodles, soft-boiled egg, and chashu pork.", // More relevant description
      imagePath: "assets/images/ramen.jpg",
      price: 12.99,
      category: FoodCategory.burgers, // You might want a 'Noodles' or 'Asian' category
      availableAddons: [
        Addon(
          name: "Extra Nori",
          price: 0.50,
        ),
        Addon(
          name: "Spicy Chili Oil",
          price: 0.75,
        ),
      ],
    ),
    Food(
      name: "Steak",
      description:
      "Grilled sirloin steak served with your choice of side.", // More relevant description
      imagePath: "assets/images/steak.jpg",
      price: 18.50,
      category: FoodCategory.burgers, // You might want a 'Main Course' category
      availableAddons: [
        Addon(
          name: "Mushroom Sauce",
          price: 2.00,
        ),
        Addon(
          name: "Grilled Onions",
          price: 1.50,
        ),
      ],
    ),

    //salads
    Food(
      name: "Classic Caesar Salad", // More specific name
      description:
      "Crisp romaine lettuce, Parmesan cheese, croutons, and Caesar dressing.", // More relevant description
      imagePath: "assets/images/santa.jpg", // Consider renaming to caesar_salad.jpg
      price: 9.50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(
          name: "Grilled Chicken",
          price: 3.00,
        ),
        Addon(
          name: "Shrimp",
          price: 4.00,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Crispy Chicken Salad", // More specific name
      description:
      "Mixed greens with crispy chicken strips, tomatoes, cucumbers, and honey mustard dressing.", // More relevant description
      imagePath: "assets/images/santa.jpg", // Consider a different image
      price: 10.50,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(
          name: "Extra Crispy Chicken",
          price: 2.50,
        ),
        Addon(
          name: "Ranch Dressing",
          price: 0.50,
        ),
      ],
    ),
    // ... (Continue updating your food items with more relevant descriptions, correct categories, and unique image paths) ...
    // Make sure all image paths exist in your assets folder and are declared in pubspec.yaml

    // Example for sides
    Food(
      name: "Onion Rings",
      description:
      "Golden crispy onion rings served with a tangy dipping sauce.",
      imagePath: "assets/images/pasta.jpg", // Should be an onion rings image
      price: 4.99,
      category: FoodCategory.side,
      availableAddons: [
        Addon(name: "Extra Sauce", price: 0.50),
      ],
    ),

    // Example for desserts
    Food(
      name: "Chocolate Brownie", // Corrected name
      description:
      "Rich chocolate brownie with a fudgy center, served warm.",
      imagePath: "assets/images/pasta.jpg", // Should be a brownie image
      price: 5.50,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(name: "Vanilla Ice Cream", price: 1.50),
        Addon(name: "Chocolate Sauce", price: 0.75),
      ],
    ),

    // Example for drinks
    Food(
      name: "Fresh Smoothie", // Corrected name
      description:
      "A blend of fresh fruits and yogurt, perfect for a healthy boost.",
      imagePath: "assets/images/hamburger.png", // Should be a smoothie image
      price: 5.99, // Adjusted price
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(name: "Protein powder", price: 0.99),
        Addon(name: "Almond Milk", price: 1.00), // Adjusted price
        Addon(name: "Chia seeds", price: 0.75), // Adjusted price
      ],
    ),
  ];

  // This list will hold the menu items currently displayed (initially empty)
  List<Food> _menu = [];
  bool _isLoading = true; // Flag to indicate loading state
  String _restaurantName = "Loading Restaurant...";
  String _restaurantImage = "assets/images/default_restaurant.png"; // Placeholder
  String _deliveryTimeEstimate = "-- min";
  double _deliveryFee = 0.0;


  //delivery address which user can change
  String _deliveryAddress = 'Mombasa,Kizingo ';

  //getter
  List<Food> get menu => _menu;
  bool get isLoading => _isLoading;
  String get restaurantName => _restaurantName;
  String get restaurantImage => _restaurantImage;
  String get deliveryTimeEstimate => _deliveryTimeEstimate;
  double get deliveryFee => _deliveryFee;

  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  // user cart
  final List<CartItem> _cart = [];


  Restaurant() {
    // Call the method to simulate fetching restaurant data
    fetchRestaurantData();
  }

  // Simulate fetching data (replace with actual async call to Firebase/API)
  Future<void> fetchRestaurantData() async {
    _isLoading = true;
    notifyListeners(); // Notify UI that loading has started

    // Simulate network delay
    await Future.delayed(const Duration(seconds: 3)); // Simulate loading time

    // Once "data is fetched", populate the actual menu and update other details
    _menu = List.from(_fullMenuData); // Copy the hardcoded data to the displayed menu
    _restaurantName = "Joel's Eatery"; // Example name
    _restaurantImage = "assets/images/restaurant_banner.jpg"; // Example image, ensure it exists
    _deliveryTimeEstimate = "25-35 min";
    _deliveryFee = 2.49;
    // You could also fetch _deliveryAddress here if it's dynamic per restaurant

    _isLoading = false; // Set loading to false
    notifyListeners(); // Notify UI that data is loaded
  }


  // add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    // (Your existing addToCart logic - seems fine)
    // ...
    // See if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
      const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    // If item already exists in cart, increment quantity
    if (cartItem != null) {
      cartItem.quantity++;
    }
    // Else (if it's a new item for the cart), add it to the cart
    else {
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
          quantity: 1,
        ),
      );
    }
    notifyListeners();
  }


  //remove
  void removeFromCart(CartItem cartItemToRemove) {
    // (Your existing removeFromCart logic - seems fine)
    // ...
    final bool removed = _cart.remove(cartItemToRemove);
    if (removed) {
      notifyListeners();
    }
  }

  void decrementItemQuantity(CartItem cartItem) {
    // (Your existing decrementItemQuantity logic - seems fine)
    // ...
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
      notifyListeners();
    }
  }

  //total price
  double getTotalPrice() {
    // (Your existing getTotalPrice logic - seems fine)
    // ...
    double total = 0.0;
    for (CartItem cartItem in _cart) {
      double itemTotal = cartItem.food.price;
      for (Addon addon in cartItem.selectedAddons) {
        itemTotal += addon.price;
      }
      total += itemTotal * cartItem.quantity;
    }
    return total;
  }

  //total items
  int getTotalItemCount() {
    // (Your existing getTotalItemCount logic - seems fine)
    // ...
    int totalItemCount = 0;
    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    // (Your existing clearCart logic - seems fine)
    // ...
    _cart.clear();
    notifyListeners();
  }

//update adress
  void updateDeliveryAddress(String newAddress) {
    // (Your existing updateDeliveryAddress logic - seems fine)
    // ...
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //generate a reciept
  String displayCartReceipt() {
    // (Your existing displayCartReceipt logic - seems fine)
    // ...
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt:");
    receipt.writeln();

    String formattedDate =
    DateFormat('yyyy-MM-dd HH:mm:ss').format(DateTime.now()); // Corrected 'MM' for month

    receipt.writeln(formattedDate);
    receipt.writeln();
    receipt.writeln("------------------------");
    for (final cartItem in _cart) {
      receipt.writeln(
          "${cartItem.quantity} x ${cartItem.food.name} - ${_formatPrice(cartItem.food.price)}");
      if (cartItem.selectedAddons.isNotEmpty) {
        receipt.writeln("  Add-Ons: ${_formatAddons(cartItem.selectedAddons)}");
      }
      receipt.writeln();
    }
    receipt.writeln("----------------------------");
    receipt.writeln();
    receipt.writeln("Total Items: ${getTotalItemCount()}");
    receipt.writeln(" Total Price: ${_formatPrice(getTotalPrice())}");
    receipt.writeln();
    receipt.writeln("Delivering to: $deliveryAddress");

    return receipt.toString();
  }

  // format double into money
  String _formatPrice(double price) {
    // (Your existing _formatPrice logic - seems fine)
    // ...
    return "\$${price.toStringAsFixed(2)}";
  }

  // format  list addons into a string summary
  String _formatAddons(List<Addon> addons) {
    // (Your existing _formatAddons logic - seems fine)
    // ...
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
