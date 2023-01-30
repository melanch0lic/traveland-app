import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

class MapPageViewModel with ChangeNotifier {
  late MapController _mapController;
  MapController get mapController => _mapController;

  LatLng? _currentLocationPosition;
  LatLng? get currentLocationPosition => _currentLocationPosition;

  // double _currentZoomLevel = 16;
  // double get currentZoomLevel => _currentZoomLevel;

  MapPageViewModel() {
    init();
  }

  void init() {
    _mapController = MapController();
    _getCurrentLocation();
    _liveLocation();
  }

  Future<void> _getCurrentLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    final Position currentPosition = await Geolocator.getCurrentPosition();
    _currentLocationPosition = LatLng(currentPosition.latitude, currentPosition.longitude);
    _mapController.move(_currentLocationPosition!, mapController.zoom);
    notifyListeners();
  }

  void onLocationButtonPressed() {
    _getCurrentLocation();
  }

  void _liveLocation() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
    );

    Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position position) {
      _currentLocationPosition = LatLng(position.latitude, position.longitude);
      notifyListeners();
    });
  }

  void increaseCurrentZoomLevel() {
    if (mapController.zoom < 16) {
      final bounds = _mapController.bounds;
      final centerZoom = _mapController.centerZoomFitBounds(bounds!);
      if (mapController.zoom > 17) {
        _mapController.move(centerZoom.center, 17);
      } else {
        _mapController.move(centerZoom.center, mapController.zoom + 1);
      }
    }
  }

  void reduceCurrentZoomLevel() {
    if (mapController.zoom > 9) {
      final bounds = _mapController.bounds;
      final centerZoom = _mapController.centerZoomFitBounds(bounds!);
      if (mapController.zoom < 8) {
        _mapController.move(centerZoom.center, 8);
      } else {
        _mapController.move(centerZoom.center, mapController.zoom - 1);
      }
    }
  }
}
