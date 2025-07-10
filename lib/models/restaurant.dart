import 'package:collection/collection.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/models/food.dart';
import 'package:intl/intl.dart';

import 'cart_item.dart';

class Restaurant extends ChangeNotifier {
  //list of food menu
  final List<Food> _menu = [
    //burger e.g bacon burger| cheese burger| vegie burger|
    Food(
      name: "Classic cheese burger",
      description:
          "A juicy beef party with melted cheder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/burger.jpg",
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
          " ** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/pancakes.jpg",
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
      name: "Ramen",
      description:
          " **** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/ramen.jpg",
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
      name: "Steak ",
      description:
          "A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/steak.jpg",
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

    //salads
    Food(
      name: "Classic salad",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/santa.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "crips salad",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/santa.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Masala salad",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/burger.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Burrito salad",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/burrito.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Onion burger",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/pasta.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),

    //sides
    Food(
      name: "Onion Rings",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/pasta.jpg",
      price: 8.99,
      category: FoodCategory.side,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Garlic Bread",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/santa.jpg",
      price: 8.99,
      category: FoodCategory.side,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Loaded Sweet Potatoes fries",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/pasta.jpg",
      price: 8.99,
      category: FoodCategory.side,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "crispy mac and cheese",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/pancakes.jpg",
      price: 8.99,
      category: FoodCategory.side,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Mac & chese",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/salmon.jpg",
      price: 8.99,
      category: FoodCategory.side,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),

    //desserts
    Food(
      name: "Chocolate brownies",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/pasta.jpg",
      price: 8.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Apple Pie",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/pasta.jpg",
      price: 8.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Red velvet lava Cake",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/pasta.jpg",
      price: 8.99,
      category: FoodCategory.desserts,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Onion Rings",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/salmon.jpg",
      price: 8.99,
      category: FoodCategory.burgers,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Mayonnaise salad",
      description:
          " *** A juicy beef party with melted chedder, lettuce, tomato, and a hint of onion and pickle",
      imagePath: "assets/images/salmon.jpg",
      price: 8.99,
      category: FoodCategory.salads,
      availableAddons: [
        Addon(
          name: "Extra kales",
          price: 0.99,
        ),
        Addon(
          name: "tomatoes",
          price: 1.99,
        ),
        Addon(
          name: "Avocado",
          price: 2.99,
        ),
      ],
    ),

    //drinks
    Food(
      name: "Smoothie",
      description:
          "A blend of fresh fruits and yogurt, perfect for a healthy boost.",
      imagePath: "assets/images/hamburger.png",
      price: 8.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(
          name: "Protein powder",
          price: 0.99,
        ),
        Addon(
          name: "Almond Milk",
          price: 1.99,
        ),
        Addon(
          name: "Chia seeds",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Mojito",
      description:
          "A classic cuban cocktail with modifies lime and mint , sweetened with sugar.",
      imagePath: "assets/images/Fast_food_combo.png",
      price: 8.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(
          name: "Extra mint ",
          price: 0.99,
        ),
        Addon(
          name: "Raspberry puree",
          price: 1.99,
        ),
        Addon(
          name: "Splash of coconut rum",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Caramel Machiato",
      description:
          "A layerd coffee drink with steamed milk espresso and vanilla syrup",
      imagePath: "assets/images/fast_food_set.png",
      price: 8.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(
          name: "Extra shot of espresso",
          price: 0.99,
        ),
        Addon(
          name: "hazel nut syrup",
          price: 1.99,
        ),
        Addon(
          name: "extra",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Lemonade",
      description:
          "A layerd coffee drink with steamed milk espresso and vanilla syrup",
      imagePath: "assets/images/fast_food_set.png",
      price: 8.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(
          name: "Extra shot of espresso",
          price: 0.99,
        ),
        Addon(
          name: "hazel nut syrup",
          price: 1.99,
        ),
        Addon(
          name: "extra",
          price: 2.99,
        ),
      ],
    ),
    Food(
      name: "Iced Tea",
      description:
          "A layerd coffee drink with steamed milk espresso and vanilla syrup",
      imagePath: "assets/images/fast_food_set.png",
      price: 8.99,
      category: FoodCategory.drinks,
      availableAddons: [
        Addon(
          name: "Extra shot of espresso",
          price: 0.99,
        ),
        Addon(
          name: "hazel nut syrup",
          price: 1.99,
        ),
        Addon(
          name: "extra",
          price: 2.99,
        ),
      ],
    ),
  ];

//delivery address which user can change
  String _deliveryAddress = 'Mombasa,Kizingo ';

  //getter
  List<Food> get menu => _menu;
  List<CartItem> get cart => _cart;
  String get deliveryAddress => _deliveryAddress;

  // user cart
  final List<CartItem> _cart = [];
// add to cart
  void addToCart(Food food, List<Addon> selectedAddons) {
    print("Restaurant: addToCart called for ${food.name}.");
    if (selectedAddons.isNotEmpty) {
      print("Restaurant: With addons: ${selectedAddons.map((a) => a.name).join(', ')}");
    } else {
      print("Restaurant: With no addons.");
    }

    print("Restaurant: _cart size BEFORE modification: ${_cart.length}");

    // See if there is a cart item already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      bool isSameFood = item.food == food;
      bool isSameAddons =
      const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    // If item already exists in cart, increment quantity
    if (cartItem != null) {
      print("Restaurant: Item already exists. Incrementing quantity for ${cartItem.food.name}.");
      cartItem.quantity++;
    }
    // Else (if it's a new item for the cart), add it to the cart
    else {
      print("Restaurant: New item. Adding ${food.name} to cart.");
      // Assuming your CartItem constructor looks something like:
      // CartItem({required this.food, required this.selectedAddons, this.quantity = 1})
      _cart.add(
        CartItem(
          food: food,
          selectedAddons: selectedAddons,
          quantity: 1, // Initial quantity for a new item
        ),
      );
    }

    print("Restaurant: _cart size AFTER modification: ${_cart.length}");
    if (_cart.isNotEmpty) {
      var lastItemFoodName = _cart.last.food.name; // Adjust if your CartItem structure is different
      print("Restaurant: Last item in _cart (food name): $lastItemFoodName, quantity: ${_cart.last.quantity}");
    }

    notifyListeners();
    print("Restaurant: notifyListeners called.");
  }


  //remove
  void removeFromCart(CartItem cartItemToRemove) {
    // The `_cart.remove()` method iterates through the list and removes the first
    // element that is equal to `cartItemToRemove` according to the `==` operator.
    final bool removed = _cart.remove(cartItemToRemove);

    if (removed) {
      if (kDebugMode) {
        print("Restaurant: Slidable delete removed ${cartItemToRemove.food.name} (Quantity: ${cartItemToRemove.quantity}) completely.");
      }
      notifyListeners(); // Crucial: Update all listening widgets
    } else {
      // This case should ideally not happen if the cartItemToRemove came directly from the cart list UI.
      if (kDebugMode) {
        print("Restaurant: Slidable delete - Item ${cartItemToRemove.food.name} not found in cart.");
      }
      // You might still call notifyListeners() or handle this as an error if appropriate.
    }
  }

  // If you still need a way to decrement quantity (e.g., from a '-' button in MyCartTile),
  // you should have a separate method for that:
  void decrementItemQuantity(CartItem cartItem) {
    // Find the item in the cart. Robust finding is key here.
    // Using indexOf relies on `CartItem`'s `==`
    int cartIndex = _cart.indexOf(cartItem);

    // Alternative robust finding (if CartItem has a unique 'id'):
    // int cartIndex = _cart.indexWhere((item) => item.id == cartItem.id);

    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
        if (kDebugMode) {
          print("Restaurant: Decremented quantity of ${_cart[cartIndex].food.name} to ${_cart[cartIndex].quantity}");
        }
        notifyListeners();
      } else {
        // If quantity is 1 and user presses '-', remove it completely.
        // This makes the minus button behave like a delete at quantity 1.
        if (kDebugMode) {
          print("Restaurant: Quantity of ${_cart[cartIndex].food.name} is 1, removing via decrement.");
        }
        _cart.removeAt(cartIndex); // Directly remove since we found its index
        notifyListeners();
      }
    } else {
      if (kDebugMode) {
        print("Restaurant: decrementItemQuantity - Item ${cartItem.food.name} not found.");
      }
    }
  }
  // void removeFromCart(CartItem cartItem) {
  //   int cartIndex = _cart.indexOf(cartItem);
  //   if (cartIndex != -1) {
  //     if (_cart[cartIndex].quantity > 1) {
  //       _cart[cartIndex].quantity--;
  //     } else {
  //       _cart.removeAt(cartIndex);
  //     }
  //   }
  //   notifyListeners();
  // }

  //total price
  double getTotalPrice() {
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
    int totalItemCount = 0;

    for (CartItem cartItem in _cart) {
      totalItemCount += cartItem.quantity;
    }
    return totalItemCount;
  }

  // clear cart
  void clearCart() {
    _cart.clear();
    notifyListeners();
  }

//update adress
  void updateDeliveryAddress(String newAddress) {
    _deliveryAddress = newAddress;
    notifyListeners();
  }

  //generate a reciept
  String displayCartReceipt() {
    final receipt = StringBuffer();
    receipt.writeln("Here's your receipt:");
    receipt.writeln();

    //format the date to include up to seconds only
    String formattedDate =
        DateFormat('yyyy-mm-dd HH:mm:ss').format(DateTime.now());

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
    return "\$${price.toStringAsFixed(2)}";
  }

  // format  list addons into a string summary
  String _formatAddons(List<Addon> addons) {
    return addons
        .map((addon) => "${addon.name} (${_formatPrice(addon.price)})")
        .join(", ");
  }
}
