import 'package:first_app/widgets/setting_switch.dart';
import 'package:flutter/material.dart';

enum Filter { glutenFree, lactoseFree, vegetarian, vegan }

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});
  @override
  State<FilterScreen> createState() {
    return _FilterScreenState();
  }
}

class _FilterScreenState extends State<FilterScreen> {
  var _isGlutenFree = false;
  var _isLactoseFree = false;
  var _isVegetarian = false;
  var _isVegan = false;

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
      body: PopScope(
        canPop: false,
        onPopInvokedWithResult: (didPop, context) {
          // pending-----
          if (didPop) return;
          Navigator.of(context as BuildContext).pop({
            Filter.glutenFree: _isGlutenFree,
            Filter.lactoseFree: _isLactoseFree,
            Filter.vegetarian: _isVegetarian,
            Filter.vegan: _isVegan,
          });
          // --------
        },
        child: Column(
          children: [
            // SwitchListTile(
            //   value: isGlutenFree,
            //   onChanged: (value) {
            //     setState(() {
            //       isGlutenFree = value;
            //     });
            //   },
            //   title: Text(
            //     'Gluten-free',
            //     style: Theme.of(context).textTheme.titleLarge!.copyWith(
            //       color: Theme.of(context).colorScheme.onSurface,
            //     ),
            //   ),
            //   subtitle: Text(
            //     'Only includes gluten free meals.',
            //     style: Theme.of(context).textTheme.labelMedium!.copyWith(
            //       color: Theme.of(context).colorScheme.onSurface,
            //     ),
            //   ),
            //   activeColor: Theme.of(context).colorScheme.tertiary,
            //   contentPadding: const EdgeInsets.only(left: 34, right: 22),
            // ),
            SettingSwitch(
              switchValue: _isGlutenFree,
              onChanged: (value) {
                setState(() {
                  _isGlutenFree = value;
                });
              },
              title: 'Gluten-free',
              subtitle: 'Only includes gluten-free meals.',
            ),
            SettingSwitch(
              switchValue: _isLactoseFree,
              onChanged: (value) {
                setState(() {
                  _isLactoseFree = value;
                });
              },
              title: 'Lactose-free',
              subtitle: 'Only includes lactose-free meals.',
            ),
            SettingSwitch(
              switchValue: _isVegetarian,
              onChanged: (value) {
                setState(() {
                  _isVegetarian = value;
                });
              },
              title: 'Vegetarian',
              subtitle: 'Only includes vegetarian meals.',
            ),
            SettingSwitch(
              switchValue: _isVegan,
              onChanged: (value) {
                setState(() {
                  _isVegan = value;
                });
              },
              title: 'Vegan',
              subtitle: 'Only includes vegan meals.',
            ),
          ],
        ),
      ),
    );
  }
}
