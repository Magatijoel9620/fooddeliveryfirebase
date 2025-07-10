import 'package:flutter/cupertino.dart'; // Import Cupertino for the switch
import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/pages/cart_page.dart';
import 'package:provider/provider.dart'; // Import Provider
import '../themes/theme_provider.dart'; // Import your ThemeProvider

class MySliverAppBar extends StatelessWidget {
  const MySliverAppBar({super.key, required this.child, required this.title});

  final Widget child;
  final Widget title;

  @override
  Widget build(BuildContext context) {
    final themeProvider = Provider.of<ThemeProvider>(context);

    return SliverAppBar(
      expandedHeight: 340,
      collapsedHeight: 120,
      floating: false,
      pinned: true,
      actions: [
        // Dark Mode Toggle IconButton
        IconButton(
          icon: Icon(
            themeProvider.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny_rounded,
            color: Theme.of(context).colorScheme.inversePrimary, // Optional: for icon color
          ),
          onPressed: () {
            Provider.of<ThemeProvider>(context, listen: false).toggleTheme();
          },
          tooltip: themeProvider.isDarkMode ? 'Switch to Light Mode' : 'Switch to Dark Mode', // Optional
        ),
        // Dark Mode Toggle
        // Padding(
        //   // Optional: Add some padding to space it out
        //   padding: const EdgeInsets.only(right: 8.0),
        //   child: CupertinoSwitch(
        //     value: Provider.of<ThemeProvider>(context).isDarkMode, // Listen to changes
        //     onChanged: (value) =>
        //         Provider.of<ThemeProvider>(context, listen: false)
        //             .toggleTheme(),
        //     activeColor: Theme.of(context).colorScheme.primary, // Optional: customize active color
        //   ),
        // ),

        //cart button
        IconButton(
          onPressed: () {
            //go to cart page
            Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const CartPage(),
                ));
          },
          icon: const Icon(Icons.shopping_cart),
        ),
      ],
      backgroundColor: Theme.of(context).colorScheme.surface,
      foregroundColor: Theme.of(context).colorScheme.inversePrimary,
      title: const Text("Sunset Diner"), // Assuming you still want this static title
      flexibleSpace: FlexibleSpaceBar(
        background: child,
        title: title, // This is the title passed to the FlexibleSpaceBar
        centerTitle: true,
        titlePadding: const EdgeInsets.only(left: 0, right: 0, top: 0),
        expandedTitleScale: 1,
      ),
    );
  }
}
