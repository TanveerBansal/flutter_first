import 'package:first_app/providers/filters_provider.dart';
import 'package:first_app/widgets/setting_switch.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FilterScreen extends ConsumerWidget {
  const FilterScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final activeFilters = ref.watch(filterProvider);
    return Scaffold(
      appBar: AppBar(title: const Text('Your Filters')),
      body: Column(
        children: [
          SettingSwitch(
            switchValue: activeFilters[Filter.glutenFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.glutenFree, value);
            },
            title: 'Gluten-free',
            subtitle: 'Only includes gluten-free meals.',
          ),
          SettingSwitch(
            switchValue: activeFilters[Filter.lactoseFree]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.lactoseFree, value);
            },
            title: 'Lactose-free',
            subtitle: 'Only includes lactose-free meals.',
          ),
          SettingSwitch(
            switchValue: activeFilters[Filter.vegetarian]!,
            onChanged: (value) {
              ref
                  .read(filterProvider.notifier)
                  .setFilter(Filter.vegetarian, value);
            },
            title: 'Vegetarian',
            subtitle: 'Only includes vegetarian meals.',
          ),
          SettingSwitch(
            switchValue: activeFilters[Filter.vegan]!,
            onChanged: (value) {
              ref.read(filterProvider.notifier).setFilter(Filter.vegan, value);
            },
            title: 'Vegan',
            subtitle: 'Only includes vegan meals.',
          ),
        ],
      ),
    );
  }
}
