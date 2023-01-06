import 'package:flutter/material.dart';

import '../../data/network/models/entity/event_entity.dart';
import '../../domain/services/events_service.dart';

class PlacesPageViewModel with ChangeNotifier {
  EventsService eventsService;

  List<EventsEntity> _events = [];
  List<EventsEntity> get events => _events;

  bool _isLocationsLoading = false;
  bool get isLocationsLoading => _isLocationsLoading;

  bool _isExcursionsLoading = false;
  bool get isExcursionsLoading => _isExcursionsLoading;

  bool _isEventsLoading = false;
  bool get isEventsLoading => _isEventsLoading;

  PageController? _controller;
  PageController? get controller => _controller;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  PlacesPageViewModel({required this.eventsService}) {
    _controller = PageController();
    init();
  }

  bool _sortFlagLocations = false;
  bool get sortFlagLocations => _sortFlagLocations;

  void init() {}

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

  Future<void> fetchLocations() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> fetchExcursions() async {
    await Future.delayed(const Duration(seconds: 1));
  }

  Future<void> fetchEvents() async {
    final response = await eventsService.getEvents();
    response.fold((result) {
      _events = result.result.places;
    }, (exception, error) {});
  }

  Future<void> onPageChanged(int page) async {
    _pageIndex = page;
    notifyListeners();
    switch (page) {
      case 0:
        _isLocationsLoading = true;
        notifyListeners();

        await fetchLocations();

        _isLocationsLoading = false;
        notifyListeners();
        break;
      case 1:
        _isExcursionsLoading = true;
        notifyListeners();

        await fetchExcursions();

        _isExcursionsLoading = false;
        notifyListeners();
        break;
      case 2:
        _isEventsLoading = true;
        notifyListeners();

        await fetchEvents();

        _isEventsLoading = false;
        notifyListeners();
        break;
      default:
    }
  }
}
