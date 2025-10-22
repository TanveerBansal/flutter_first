import 'package:first_app/_favorite_place/screens/add_place.dart';
import 'package:first_app/_favorite_place/widgets/places_list.dart';
import 'package:flutter/material.dart';

class PlacesListScreen extends StatelessWidget {
  const PlacesListScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Your Places',
          style: TextStyle(
            backgroundColor: Theme.of(context).colorScheme.surface,
          ),
        ),
        actions: [IconButton(onPressed: () {
          Navigator.of(context).push(MaterialPageRoute(builder: (ctx)=> const AddPlaceScreen()));
        }, icon: const Icon(Icons.add))],
      ),
      body:  PlacesListWidget(places: []),
    );
  }
}
