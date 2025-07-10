import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/components/my_drawer_tile.dart';
import 'package:food_delivery_firebase/pages/cart_page.dart'; // <<<--- ADD THIS IMPORT
import '../pages/settings_page.dart';
import '../services/auth/auth_service.dart';

class MyDrawer extends StatelessWidget {
  const MyDrawer({super.key});

  void logout(BuildContext context) { // Pass BuildContext if you need to pop/navigate after logout
    final authService = AuthService();
    authService.signOut();
    // Optionally, navigate to login screen after logout
    // Navigator.of(context).pushAndRemoveUntil(MaterialPageRoute(builder: (context) => LoginPage()), (route) => false);
  }

  @override
  Widget build(BuildContext context) {
    return Drawer(
      backgroundColor: Theme.of(context).colorScheme.surface,
      child: Column(children: [
        // Drawer Header
        Padding(
          padding: const EdgeInsets.only(top: 100.0), // Adjust padding as needed for a proper header
          child: Column(
            children: [
              Icon(
                Icons.fastfood_rounded, // Changed icon to something more food related
                size: 80,
                color: Theme.of(context).colorScheme.inversePrimary,
              ),
              const SizedBox(height: 10),
              Text(
                "Foodie App", // Example App Name
                style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Theme.of(context).colorScheme.inversePrimary,
                ),
              ),
            ],
          ),
        ),

        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0, vertical: 15.0), // Adjusted padding
          child: Divider(
            color: Theme.of(context).colorScheme.secondary,
          ),
        ),

        // Home list Tile
        MyDrawerTile(
          text: "HOME",
          icon: Icons.home_outlined, // Using outlined icons for consistency
          onTap: () {
            Navigator.pop(context); // Close the drawer
            // Potentially navigate to home if not already there or if you want to ensure it's the top route
            // Navigator.of(context).pushNamedAndRemoveUntil('/home', (route) => false);
          },
        ),

        // Cart list Tile  <<<--- NEW TILE
        MyDrawerTile(
          text: "MY CART",
          icon: Icons.shopping_cart_outlined, // Using outlined cart icon
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const CartPage(), // Navigate to CartPage
              ),
            );
          },
        ),

        // Settings list Tile
        MyDrawerTile(
          text: "SETTINGS",
          icon: Icons.settings_outlined, // Using outlined settings icon
          onTap: () {
            Navigator.pop(context); // Close the drawer
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const SettingsPage(),
              ),
            );
          },
        ),

        const Spacer(), // Pushes logout to the bottom

        // Logout list Tile
        MyDrawerTile(
          text: "LOGOUT",
          icon: Icons.logout_outlined, // Using outlined logout icon
          onTap: () => logout(context), // Pass context to logout if needed for navigation
        ),
        const SizedBox(
          height: 25,
        ),
      ]),
    );
  }
}
