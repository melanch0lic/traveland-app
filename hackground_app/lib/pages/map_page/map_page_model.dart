import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';

class MapPageViewModel with ChangeNotifier {
  late MapController _mapController;
  MapController get mapController => _mapController;

  double _currentZoomLevel = 16;
  double get currentZoomLevel => _currentZoomLevel;

  MapPageViewModel() {
    init();
  }

  void init() {
    _mapController = MapController();
  }

  void increaseCurrentZoomLevel() {
    if (_currentZoomLevel < 16) {
      final bounds = _mapController.bounds;
      final centerZoom = _mapController.centerZoomFitBounds(bounds!);
      _currentZoomLevel = centerZoom.zoom + 1;
      if (_currentZoomLevel > 17) {
        _currentZoomLevel = 17;
      }
      _mapController.move(centerZoom.center, _currentZoomLevel);
    }
  }

  void reduceCurrentZoomLevel() {
    if (_currentZoomLevel > 9) {
      final bounds = _mapController.bounds;
      final centerZoom = _mapController.centerZoomFitBounds(bounds!);
      _currentZoomLevel = centerZoom.zoom - 1;
      if (_currentZoomLevel < 8) {
        _currentZoomLevel = 8;
      }
      _mapController.move(centerZoom.center, _currentZoomLevel);
    }
  }
}
