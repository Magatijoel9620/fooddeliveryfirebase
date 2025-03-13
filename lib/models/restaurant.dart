import 'package:collection/collection.dart';
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
    //see if there is a cartitem already with the same food and selected addons
    CartItem? cartItem = _cart.firstWhereOrNull((item) {
      //check if food same
      bool isSameFood = item.food == food;
//check if addons same
      bool isSameAddons =
          const ListEquality().equals(item.selectedAddons, selectedAddons);
      return isSameFood && isSameAddons;
    });

    //if items alreaedy exists
    cartItem?.quantity++;
      notifyListeners();
  }

  //remove
  void removeFromCart(CartItem cartItem) {
    int cartIndex = _cart.indexOf(cartItem);
    if (cartIndex != -1) {
      if (_cart[cartIndex].quantity > 1) {
        _cart[cartIndex].quantity--;
      } else {
        _cart.removeAt(cartIndex);
      }
    }
    notifyListeners();
  }

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
