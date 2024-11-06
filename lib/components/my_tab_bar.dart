import 'package:flutter/material.dart';
import 'package:food_delivery_firebase/models/food.dart';

class MyTabBar extends StatelessWidget {
  const MyTabBar({super.key, required this.tabController});

  final TabController tabController;

  List<Tab> _buildCategoryTabs() {
    return FoodCategory.values.map((category) {
      return Tab(
        text: category.toString().split('.').last,
      );
    }).toList();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: TabBar(
        labelColor: Theme.of(context).colorScheme.inversePrimary,
        
        controller: tabController,
        tabs: _buildCategoryTabs(),
      ),
    );
  }
}