import 'package:first_app/models/meal.dart';
import 'package:flutter_riverpod/legacy.dart';

// NOTE: in the StateNotifier you are allow to update the value, so you have to reassign it
class FavoritesMealsNotifier extends StateNotifier<List<Meal>> {
  FavoritesMealsNotifier() : super([]); //intilize with empty list 

  String toggleMealFavoriteStatus(Meal meal) {
    final isAlreadyFav = state.contains(meal);
    if (isAlreadyFav) {
      state = state.where((data) => data.id != meal.id).toList();
      return 'Meal Removed';
    } else {
      state = [...state, meal];
      return 'Meal added as favorite';
    }
  }
}

final favoritesMealProvider = StateNotifierProvider<FavoritesMealsNotifier,List<Meal>>((ref) {
  return FavoritesMealsNotifier();
});
