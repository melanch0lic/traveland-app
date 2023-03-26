import 'package:flutter/material.dart';

import '../../data/network/models/entity/event_entity.dart';
import '../../data/network/models/entity/place_entity.dart';
import '../../data/network/models/entity/tour_entity.dart';
import '../../domain/services/events_service.dart';
import '../../domain/services/excursions_service.dart';
import '../../domain/services/places_service.dart';

enum CategoryLocationMode { all, restaurant, culture, cafe, bar, fastfood, pizza }

class PlacesPageViewModel with ChangeNotifier {
  final PlacesService placesService;
  final EventsService eventsService;
  final ExcursionsService excursionsService;

  int _excursionOffset = 1;

  late ScrollController _excursionController;
  ScrollController get excursionController => _excursionController;

  late ScrollController _locationController;
  ScrollController get locationController => _locationController;

  late ScrollController _eventController;
  ScrollController get eventController => _eventController;

  List<PlaceEntity> _places = [];
  List<PlaceEntity> get places => _places;

  List<EventsEntity> _events = [];
  List<EventsEntity> get events => _events;

  final List<TourEntity> _excursions = [];
  List<TourEntity> get excursions => _excursions;

  bool _excursionsHasNextPage = true;

  bool _isLocationsLoading = false;
  bool get isLocationsLoading => _isLocationsLoading;

  bool _isExcursionsLoading = false;
  bool get isExcursionsLoading => _isExcursionsLoading;

  bool _isExcursionsLoadingMore = false;
  bool get isExcursionsLoadingMore => _isExcursionsLoadingMore;

  bool _isEventsLoading = false;
  bool get isEventsLoading => _isEventsLoading;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  PlacesPageViewModel({required this.placesService, required this.eventsService, required this.excursionsService}) {
    _excursionController = ScrollController();
    _locationController = ScrollController();
    _eventController = ScrollController();
    init();
  }

  bool _sortFlagLocations = false;
  bool get sortFlagLocations => _sortFlagLocations;

  Future<void> init() async {
    _isLocationsLoading = true;
    notifyListeners();

    await fetchPlaces();

    _isLocationsLoading = false;
    notifyListeners();
  }

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

  CategoryLocationMode _currentLocationCategoryMode = CategoryLocationMode.all;
  CategoryLocationMode get currentCategoryMode => _currentLocationCategoryMode;

  void onLocationCategoryChanged(CategoryLocationMode categoryMode) {
    _currentLocationCategoryMode = categoryMode;
    notifyListeners();
  }

  String _sortByPlaces = 'name';
  String get sortByPlaces => _sortByPlaces;
  String _sortOrderPlaces = 'asc';
  int _placeTypeId = 0;

  Future<void> sortPlacesParametersChange(String sortBy, String sortOrder) async {
    _isLocationsLoading = true;
    notifyListeners();

    _sortByPlaces = sortBy;
    _sortOrderPlaces = sortOrder;
    await fetchPlaces();

    _sortFlagLocations = false;
    _isLocationsLoading = false;
    notifyListeners();
  }

  Future<void> placeTypeIdChange(CategoryLocationMode categoryMode) async {
    _isLocationsLoading = true;
    notifyListeners();
    switch (currentCategoryMode) {
      case CategoryLocationMode.all:
        _placeTypeId = 0;
        break;
      case CategoryLocationMode.restaurant:
        _placeTypeId = 3;
        break;
      case CategoryLocationMode.culture:
        _placeTypeId = 4;
        break;
      case CategoryLocationMode.cafe:
        _placeTypeId = 5;
        break;
      case CategoryLocationMode.bar:
        _placeTypeId = 6;
        break;
      case CategoryLocationMode.fastfood:
        _placeTypeId = 7;
        break;
      case CategoryLocationMode.pizza:
        _placeTypeId = 8;
        break;
    }
    await fetchPlaces();

    _isLocationsLoading = false;
    notifyListeners();
  }

  Future<void> fetchPlaces() async {
    final response = await placesService.getPlaces(sortByPlaces, _sortOrderPlaces, _placeTypeId);
    response.fold((result) {
      _places = result.result.places;
    }, (exception, error) {});
  }

  Future<void> fetchExcursions() async {
    final response = await excursionsService.getTours(_excursionOffset);
    response.fold((result) {
      _excursionsHasNextPage = result.next == null ? false : true;
      _excursions.addAll(result.results);
      _excursionOffset++;
    }, (exception, error) {});
  }

  Future<void> fetchEvents() async {
    final response = await eventsService.getEvents('name', 'asc', 0);
    response.fold((result) {
      _events = result.result.places;
    }, (exception, error) {});
  }

  Future<void> onPageChanged(int page) async {
    _pageIndex = page;
    notifyListeners();
    switch (page) {
      case 1:
        if (excursions.isEmpty) {
          _isExcursionsLoading = true;
          notifyListeners();

          _excursionController.addListener(() async {
            if (_excursionController.position.extentAfter < 200 &&
                _isExcursionsLoadingMore == false &&
                _excursionsHasNextPage) {
              _isExcursionsLoadingMore = true;
              notifyListeners();

              await fetchExcursions();

              _isExcursionsLoadingMore = false;
              notifyListeners();
            }
          });

          await fetchExcursions();

          _isExcursionsLoading = false;
          notifyListeners();
        }
        break;
      case 2:
        if (events.isEmpty) {
          _isEventsLoading = true;
          notifyListeners();

          await fetchEvents();

          _isEventsLoading = false;
          notifyListeners();
        }
        break;
      default:
    }
  }

  @override
  void dispose() {
    _excursionController.dispose();
    super.dispose();
  }
}
