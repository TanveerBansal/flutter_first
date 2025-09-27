// In this ANimation implemented

import 'package:first_app/_meal_app/models/category.dart';
import 'package:first_app/_meal_app/models/meal.dart';
import 'package:first_app/_meal_app/screens/meals.dart';
import 'package:first_app/_meal_app/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:first_app/_meal_app/data/dummay_data.dart';

class CategoryScreen extends StatefulWidget {
  const CategoryScreen({super.key, required this.availableMeals});
  final List<Meal> availableMeals;

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen>
    with SingleTickerProviderStateMixin {
  // NOTE: here 'late' keyword dart that it will have value before the build executed, as during creation of class its value it null;
  late AnimationController _animationController;

  @override
  void initState() {
    super.initState();
    _animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    _animationController.forward();
  }

  @override
  void dispose() {
    // NOTE: here we use dispose method to _animationController, because to remove it from the memory as the widget remved, so it don't hold space on memery
    _animationController.dispose();
    super.dispose();
  }

  void _selectCategory(BuildContext context, Category category) {
    final meals = widget.availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Here we implement navigation to Meals Screen
    // NOTE: Navigator put the screen to top most layer of the stack
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(title: category.title, meals: meals),
      ),
    );
    // this can be written another as show below, (both will work same)
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealsScreen(title: "Meals Test", meals: [])));
  }

  @override
  Widget build(BuildContext context) {
    return
    // NOTE: GridView.builder allow to make the Grid dynamically (like the ListBuilder), this help in the performance optimization, but here we have some a finite number of categories so here simple GridView is implemented
    AnimatedBuilder(
      animation: _animationController,
      child: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(
              category: category,
              key: ValueKey(category.id),
              onSelect: () {
                _selectCategory(context, category);
              },
            ),
        ],
      ),
      builder: (context, child) => SlideTransition(
        position: Tween(
          begin: const Offset(0, 0.3),
          end: const Offset(0, 0),
        ).animate(CurvedAnimation(parent: _animationController, curve: Curves.easeInOut)),

        child: child,
      ),
      // Padding(
      //   padding: EdgeInsets.only(top: 100 - _animationController.value * 100),
      //   child: child,
      // ),
    );
  }
}
