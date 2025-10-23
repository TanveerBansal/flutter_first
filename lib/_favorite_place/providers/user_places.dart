import 'package:first_app/_favorite_place/models/place.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserPlacesNotifier extends StateNotifier<List<PlaceModel>> {
  UserPlacesNotifier() : super(const []);
  void addPlace(String place) {
    final newPlace = PlaceModel(title: place);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<PlaceModel>>(
      (ref) => UserPlacesNotifier(),
    );
