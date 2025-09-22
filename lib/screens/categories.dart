import 'package:first_app/models/category.dart';
import 'package:first_app/models/meal.dart';
import 'package:first_app/screens/meals.dart';
import 'package:first_app/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:first_app/data/dummay_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({
    super.key,
    required this.onToggleFavourite,
    required this.availableMeals,
  });
  final void Function(Meal meal) onToggleFavourite;
  final List<Meal> availableMeals;

  void _selectCategory(BuildContext context, Category category) {
    final meals = availableMeals
        .where((meal) => meal.categories.contains(category.id))
        .toList();

    // Here we implement navigation to Meals Screen
    // NOTE: Navigator put the screen to top most layer of the stack
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (ctx) => MealsScreen(
          title: category.title,
          meals: meals,
          onToggleFavourite: onToggleFavourite,
        ),
      ),
    );
    // this can be written another as show below, (both will work same)
    // Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=>MealsScreen(title: "Meals Test", meals: [])));
  }

  @override
  Widget build(BuildContext context) {
    return
    // NOTE: GridView.builder allow to make the Grid dynamically (like the ListBuilder), this help in the performance optimization, but here we have some a finite number of categories so here simple GridView is implemented
    GridView(
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
    );
  }
}
