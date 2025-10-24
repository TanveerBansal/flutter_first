import 'package:first_app/_favorite_place/screens/place_detail.dart';
import 'package:flutter/material.dart';
import 'package:first_app/_favorite_place/models/place.dart';

class PlacesListWidget extends StatelessWidget {
  const PlacesListWidget({super.key, required this.places});
  final List<PlaceModel> places;

  void _handleTap(PlaceModel place, BuildContext context) {
    Navigator.of(context).push(
      MaterialPageRoute(builder: (ctx) => PlaceDetailScreen(place: place)),
    );
  }

  @override
  Widget build(BuildContext context) {
    if (places.isEmpty) {
      return Center(
        child: Text(
          'No place added yet.',
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
      );
    }

    return ListView.builder(
      itemCount: places.length,
      itemBuilder: (ctx, index) => ListTile(
        leading: CircleAvatar(
          radius: 26,
          backgroundImage: FileImage(places[index].image),
        ),
        title: Text(
          places[index].title,
          style: Theme.of(context).textTheme.titleMedium!.copyWith(
            color: Theme.of(context).colorScheme.onSurface,
          ),
        ),
        onTap: () {
          _handleTap(places[index], context);
        },
      ),
    );
  }
}
