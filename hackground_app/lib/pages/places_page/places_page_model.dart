import 'package:flutter/material.dart';

class PlacesPageViewModel with ChangeNotifier {
  bool _isLoading = false;
  bool get isLoading => _isLoading;

  PageController? _controller;
  PageController? get controller => _controller;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  PlacesPageViewModel() {
    _controller = PageController();
  }

  bool _sortFlagLocations = false;
  bool get sortFlagLocations => _sortFlagLocations;

  void onSortFlagLocationsPressed() {
    _sortFlagLocations = !_sortFlagLocations;
    notifyListeners();
  }

  bool _sortFlagExcursions = false;
  bool get sortFlagExcursions => _sortFlagExcursions;

  void onSortFlagExcursionsPressed() {
    _sortFlagExcursions = !_sortFlagExcursions;
    notifyListeners();
  }

  bool _sortFlagEvents = false;
  bool get sortFlagEvents => _sortFlagEvents;

  void onSortFlagEventsPressed() {
    _sortFlagEvents = !_sortFlagEvents;
    notifyListeners();
  }

  void onPageChanged(int page) {
    _pageIndex = page;
    notifyListeners();
  }
}
