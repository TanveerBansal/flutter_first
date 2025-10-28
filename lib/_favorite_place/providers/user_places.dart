import 'dart:io';
import 'package:first_app/_favorite_place/models/place.dart';
import 'package:flutter_riverpod/legacy.dart';

class UserPlacesNotifier extends StateNotifier<List<PlaceModel>> {
  UserPlacesNotifier() : super(const []);
  void addPlace(String place, File image, PlaceLocationModal location) {
    final newPlace = PlaceModel(title: place, image: image, location: location);
    state = [newPlace, ...state];
  }
}

final userPlacesProvider =
    StateNotifierProvider<UserPlacesNotifier, List<PlaceModel>>(
      (ref) => UserPlacesNotifier(),
    );
