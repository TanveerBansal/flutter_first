import 'package:flutter/material.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var idGlutenFree = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      // drawer: MainDrawer(
      //   onSelectScreen: (identifier) {
      //     Navigator.of(context).pop();
      //     if (identifier == 'meals') {
      //       Navigator.pushReplacement(
      //         context,
      //         MaterialPageRoute(builder: (ctx) => const TabsScreen()),
      //       );
      //     }
      //   },
      // ),
      body: Column(
        children: [
          SwitchListTile(
            value: idGlutenFree,
            onChanged: (value) {
              setState(() {
                idGlutenFree = value;
              });
            },
            title: Text(
              'Gluten-free',
              style: Theme.of(context).textTheme.titleLarge!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            subtitle: Text(
              'Only includes gluten free meals.',
              style: Theme.of(context).textTheme.labelMedium!.copyWith(
                color: Theme.of(context).colorScheme.onSurface,
              ),
            ),
            activeColor: Theme.of(context).colorScheme.tertiary,
            contentPadding: const EdgeInsets.only(left: 34, right: 22),
          ),
        ],
      ),
    );
  }
}
