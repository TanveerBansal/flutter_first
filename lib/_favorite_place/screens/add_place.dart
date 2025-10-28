import 'dart:io';

import 'package:first_app/_favorite_place/models/place.dart';
import 'package:first_app/_favorite_place/providers/user_places.dart';
import 'package:first_app/_favorite_place/widgets/image_input.dart';
import 'package:first_app/_favorite_place/widgets/location_input.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AddPlaceScreen extends ConsumerStatefulWidget {
  const AddPlaceScreen({super.key});
  @override
  ConsumerState<AddPlaceScreen> createState() {
    return _AddPlaceScreenState();
  }
}

class _AddPlaceScreenState extends ConsumerState<AddPlaceScreen> {
  final _titleController = TextEditingController();
  File? _clickedImage;

  void onClickImage(File image) {
    _clickedImage = image;
  }

  void _savePlace() {
    final enteredPlace = _titleController.text;
    if (enteredPlace.isEmpty || _clickedImage == null) {
      return;
    }
    ref
        .read(userPlacesProvider.notifier)
        .addPlace(enteredPlace, _clickedImage!,const PlaceLocationModal(latitude:2.0, longitude:3.1,address:'123, XYZ Streed, London'));
    Navigator.of(context).pop();
  }

  @override
  void dispose() {
    _titleController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Add new widget')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(12),
        child: Column(
          children: [
            TextField(
              decoration: const InputDecoration(labelText: 'Title'),
              style: TextStyle(color: Theme.of(context).colorScheme.onSurface),
              controller: _titleController,
              textCapitalization: TextCapitalization.sentences,
            ),
            const SizedBox(height: 10),
            const LocationInput(),
            const SizedBox(height: 10),
            ImageInput(onClickImage: onClickImage),
            const SizedBox(height: 16),
            ElevatedButton.icon(
              onPressed: _savePlace,
              icon: const Icon(Icons.add),
              label: const Text('Add place'),
            ),
          ],
        ),
      ),
    );
  }
}
