import 'package:first_app/_favorite_place/models/place.dart';
import 'package:flutter/material.dart';

class PlaceDetailScreen extends StatelessWidget {
  const PlaceDetailScreen({super.key, required this.place});
  final PlaceModel place;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(place.title)),
      body: Stack(children: [
        Image.file(place.image, fit: BoxFit.cover, width: double.infinity, height: double.infinity,)
      ],),
    );
  }
}
