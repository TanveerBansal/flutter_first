import 'package:flutter/material.dart';
import 'package:first_app/_favorite_place/models/place.dart';

class PlacesListWidget extends StatelessWidget {
  const PlacesListWidget({super.key, required this.places});
  final List<PlaceModel> places;
  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(child: Text('No place added yet.', style: Theme.of(context).textTheme.titleMedium!.copyWith(color :Theme.of(context).colorScheme.onSurface)));
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(title: Text(places[index].title, style: Theme.of(context).textTheme.titleMedium!.copyWith(color :Theme.of(context).colorScheme.onSurface),)),
    );
  }
}
