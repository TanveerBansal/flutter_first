import 'package:first_app/widgets/category_grid_item.dart';
import 'package:flutter/material.dart';
import 'package:first_app/data/dummay_data.dart';

class CategoryScreen extends StatelessWidget {
  const CategoryScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Select your category')),
      // NOTE: GridView.builder allow to make the Grid dynamically (like the ListBuilder), this help in the performance optimization, but here we have some a finite number of categories so here simple GridView is implemented
      body: GridView(
        padding: const EdgeInsets.all(24),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          childAspectRatio: 3 / 2,
          crossAxisSpacing: 20,
          mainAxisSpacing: 20,
        ),
        children: [
          for (final category in availableCategories)
            CategoryGridItem(category: category, key: ValueKey(category.id),),
        ],
      ),
    );
  }
}
