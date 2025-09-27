import 'package:first_app/_meal_app/providers/favorites_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

// import 'package:first_app/providers/meals_provider.dart';
// import 'package:first_app/data/dummay_data.dart';
// import 'package:first_app/models/meal.dart';
import 'package:first_app/_meal_app/screens/categories.dart';
import 'package:first_app/_meal_app/screens/filter.dart';
import 'package:first_app/_meal_app/screens/meals.dart';
import 'package:first_app/_meal_app/widgets/main_drawer.dart';
import 'package:first_app/_meal_app/providers/filters_provider.dart';

// NOTE: While using the riverpod provider in class, we replace the StatefullWidget with ConsumerStatefulWidget and the StatelessWidget with the ConsumerWidget
class TabsScreen extends ConsumerStatefulWidget {
  const TabsScreen({super.key});
  @override
  //NOTE: State changes to ConsumerState while using riverpod
  // State<TabsScreen> createState() {
  ConsumerState<TabsScreen> createState() {
    return _TabScreenState();
  }
}

class _TabScreenState extends ConsumerState<TabsScreen> {
  int _selectedPageIndex = 0;

  void _selectPage(int index) {
    setState(() {
      _selectedPageIndex = index;
    });
  }

  void _setScreen(String identifier) async {
    Navigator.of(context).pop();
    if (identifier == 'filters') {
      // final result = await Navigator.pushReplacement(
      await Navigator.push<Map<Filter, bool>>(
        context,
        MaterialPageRoute(
          builder: (ctx) => const FilterScreen(),
        ),
      );

    } else {}
  }

  @override
  Widget build(BuildContext context) {
    // NOTE: here ref is provided by the riverpod, and watch() method accepts an argument which you make, and watch is reponsible to re-execute the build method when ever the data is changed;
    final availableMeals = ref.watch(filteredMealsProvider);

    Widget activeScreen = CategoryScreen(
      availableMeals: availableMeals,
    );
    var activeScreenTitle = 'Categories';
    if (_selectedPageIndex == 1) {
      final favoriteMeals = ref.watch(favoritesMealProvider);
      activeScreen = MealsScreen(
        meals: favoriteMeals,
      );
      activeScreenTitle = 'Your Favorites';
    }

    return Scaffold(
      appBar: AppBar(title: Text(activeScreenTitle)),
      drawer: MainDrawer(onSelectScreen: _setScreen),
      body: activeScreen,
      bottomNavigationBar: BottomNavigationBar(
        onTap:
            _selectPage, // NOTE: This onTap fn of BottomNavigationBar automatically receive an integer which is index;
        currentIndex: _selectedPageIndex,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(Icons.set_meal),
            label: 'Categories',
          ),
          BottomNavigationBarItem(icon: Icon(Icons.star), label: 'Favorites'),
        ],
      ),
    );
  }
}
