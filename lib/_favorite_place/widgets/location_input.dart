// import 'dart:convert';
import 'package:first_app/_favorite_place/models/place.dart';
import 'package:flutter/material.dart';
// import 'package:http/http.dart' as http;
import 'package:location/location.dart';

class LocationInput extends StatefulWidget {
  const LocationInput({super.key});

  @override
  State<LocationInput> createState() {
    return _LocationInputState();
  }
}

class _LocationInputState extends State<LocationInput> {
  PlaceLocationModal? _pickedLocation;


  void _getCurrentLocation() async {
    Location location = Location();
    bool serviceEnabled;
    PermissionStatus permissionGranted;
    LocationData locationData;

    serviceEnabled = await location.serviceEnabled();
    if (!serviceEnabled) {
      serviceEnabled = await location.requestService();
      if (!serviceEnabled) {
        return;
      }
    }
    permissionGranted = await location.hasPermission();
    if (permissionGranted == PermissionStatus.denied) {
      permissionGranted = await location.requestPermission();
      if (permissionGranted != PermissionStatus.granted) {
        return;
      }
    }
    locationData = await location.getLocation();
    // final url = Uri.parse(
    //   'https://maps.googleapis.com/maps/api/geocode/josn?latlng=${locationData.latitude},${locationData.longitude}&key=AIzaSyAOVYRIgupAurZup5y1PRh8Ismb1A3lLao',
    // );
    // final googleResp = await http.get(url);
    // final decodedResp = json.decode(googleResp.body);
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 170,
          width: double.infinity,
          alignment: Alignment.center,
          decoration: BoxDecoration(
            border: Border.all(
              width: 1.1,
              color: Theme.of(context).colorScheme.primary.withAlpha(40),
            ),
          ),

          child: Text(
            'No location chossen',
            textAlign: TextAlign.center,
            style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              color: Theme.of(context).colorScheme.onSurface,
            ),
          ),
        ),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            TextButton.icon(
              onPressed: _getCurrentLocation,
              label: const Text('Get current location'),
              icon: const Icon(Icons.location_on),
            ),
            TextButton.icon(
              onPressed: () {},
              label: const Text('Select on map'),
              icon: const Icon(Icons.map),
            ),
          ],
        ),
      ],
    );
  }
}
