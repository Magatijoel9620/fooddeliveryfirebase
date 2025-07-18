// ignore_for_file: sort_child_properties_last

import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/components/my_current_location.dart';
import 'package:food_delivery_firebase/components/my_description_box.dart';
import 'package:food_delivery_firebase/components/my_food_tile.dart';
import 'package:food_delivery_firebase/components/my_sliver_app_bar.dart';
// Import your skeleton widgets
import 'package:food_delivery_firebase/components/skeletons/skeleton_current_location.dart';
import 'package:food_delivery_firebase/components/skeletons/skeleton_description_box.dart';
import 'package:food_delivery_firebase/components/skeletons/skeleton_food_tile.dart';
import 'package:food_delivery_firebase/models/food.dart';
import 'package:food_delivery_firebase/models/restaurant.dart';
import 'package:provider/provider.dart';

import '../components/my_drawer.dart';
import '../components/my_tab_bar.dart';
import 'food_page.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin {
  late TabController _tabController;
  bool _isLoading = true; // Added loading state

  @override
  void dispose() {
    _tabController.dispose();
    super.dispose(); // Correct order for dispose
  }

  @override
  void initState() {
    super.initState();
    _tabController =
        TabController(length: FoodCategory.values.length, vsync: this);
    _loadData(); // Call method to load data
  }

  // Simulate data loading (replace with your actual data fetching logic)
  Future<void> _loadData() async {
    // Access your Restaurant provider to fetch data.
    // This is just an example, adapt it to how your Restaurant provider works.
    final restaurant = Provider.of<Restaurant>(context, listen: false);

    // Assuming your Restaurant provider has a method like `fetchRestaurantData`
    // and a way to tell if it's currently loading or has loaded data.
    // For this example, we'll just use a delay and check if the menu is empty.

    // If your Restaurant class handles its own loading state, you might observe that.
    // For example: if (restaurant.isLoading) ... then when it's done ... setState

    // Simple delay for demonstration
    await Future.delayed(const Duration(seconds: 3));

    // After data is "fetched", update the state
    if (mounted) { // Check if the widget is still in the tree
      setState(() {
        _isLoading = false; // restaurant.menu.isEmpty; // Or a dedicated isLoading flag in Restaurant
      });
    }
  }


  List<Widget> getFoodInThisCategory(List<Food> fullMenu, bool isLoading) {
    if (isLoading) {
      // Return skeleton list for each category
      return FoodCategory.values.map((_) {
        return ListView.builder(
          itemCount: 5, // Show a few skeleton tiles
          physics: const NeverScrollableScrollPhysics(),
          padding: EdgeInsets.zero,
          itemBuilder: (context, index) => const SkeletonFoodTile(),
        );
      }).toList();
    }

    // Actual data display
    return FoodCategory.values.map((category) {
      List<Food> categoryMenu = _filterMenuByCategory(category, fullMenu);
      if (categoryMenu.isEmpty && fullMenu.isNotEmpty) {
        // Optional: Show a message if a category is empty but others have items
        return Center(child: Text("No items in ${category.name}", style: TextStyle(color: Colors.grey[600])));
      }
      if (categoryMenu.isEmpty && fullMenu.isEmpty && !isLoading) {
        // This case might mean no data was loaded at all
        return Center(child: Text("Menu is currently unavailable.", style: TextStyle(color: Colors.grey[600])));
      }


      return ListView.builder(
        itemCount: categoryMenu.length,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final food = categoryMenu[index];
          return FoodTile(
              food: food,
              onTap: () => Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => FoodPage(
                        food: food,
                      ))));
        },
      );
    }).toList();
  }

  List<Food> _filterMenuByCategory(FoodCategory category, List<Food> fullMenu) {
    return fullMenu.where((food) => food.category == category).toList();
  }

  @override
  Widget build(BuildContext context) {
    // You might want to watch the Restaurant provider here if its state dictates loading
    final restaurant = context.watch<Restaurant>(); // Watching for changes
    final bool showSkeletons = restaurant.isLoading;
    // Determine loading state based on your Restaurant model or a local flag
    // This is a simplified example. Ideally, your Restaurant model would have an isLoading flag.
    // bool isLoading = _isLoading; // Using local state for this example
    // Or if Restaurant model has loading state:
    // bool isLoading = restaurant.isLoading || restaurant.menu.isEmpty;


    return Scaffold(
      drawer: const MyDrawer(),
      body: NestedScrollView(
          headerSliverBuilder: ((context, innerBoxIsScrolled) => [
            MySliverAppBar(
              title: MyTabBar(tabController: _tabController), // TabBar might also need a skeleton if tabs are dynamic
              child: Padding(
                padding: const EdgeInsets.only(top: 80.0), // Adjust if MySliverAppBar has changed height
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start, // Changed from .end
                  crossAxisAlignment: CrossAxisAlignment.start, // For location text
                  children: [
                    Divider(
                      indent: 25,
                      endIndent: 25,
                      color: Theme.of(context).colorScheme.secondary,
                    ),
                    _isLoading
                        ? const SkeletonCurrentLocation()
                        : const MyCurrentLocation(),
                    _isLoading
                        ? const SkeletonDescriptionBox()
                        : const MyDescriptionBox(),
                    // const SizedBox(height: 10), // Reduced or managed by skeleton height
                  ],
                ),
              ),
            ),
          ]),
          body: Consumer<Restaurant>( // Keep consumer for menu updates
              builder: (context, restaurantProvider, child) {
                // Use restaurantProvider.menu to get the actual menu
                // The _isLoading flag in _HomePageState handles the initial skeleton display
                return TabBarView(
                  controller: _tabController,
                  children: getFoodInThisCategory(restaurantProvider.menu, _isLoading),
                );
              }
          )
      ),
    );
  }
}
