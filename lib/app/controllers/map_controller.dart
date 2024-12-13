import 'dart:async';
import 'package:geolocator/geolocator.dart';
import 'package:flutter_map/flutter_map.dart';  // Correct import for MapController
import 'package:latlong2/latlong.dart';      // LatLng for location handling
import '../models/map_model.dart';

class CustomMapController {
  final MapController mapController = MapController();  // Correct instantiation of flutter_map's MapController

  // Get the current location of the user
  Future<LocationModel?> getCurrentLocation() async {
    bool serviceEnabled;
    LocationPermission permission;

    // Check if location services are enabled
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      print("Location services are disabled.");
      return null;
    }

    // Check for location permissions
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        print("Location permission denied.");
        return null;
      }
    }

    if (permission == LocationPermission.deniedForever) {
      print("Location permission is permanently denied.");
      return null;
    }

    // Get the current position
    Position position = await Geolocator.getCurrentPosition(
        desiredAccuracy: LocationAccuracy.high);

    return LocationModel(
      latitude: position.latitude,
      longitude: position.longitude,
    );
  }

  // Move the map's camera to the given location (using OSM)
  Future<void> moveCameraToLocation(LocationModel location) async {
    try {
      // Animate camera movement to the new position with a smooth transition
      mapController.move(
        LatLng(location.latitude, location.longitude),
        12.0, // Zoom level
      );
    } catch (e) {
      print("Error moving camera: $e");
    }
  }

  Future<void> recenterCamera() async {
    LocationModel? currentLocation = await getCurrentLocation();
    if (currentLocation != null) {
      moveCameraToLocation(currentLocation);
    } else {
      print("Unable to recenter camera: current location is null.");
    }
  }
}
