import 'package:flutter/material.dart';

import '../../data/network/models/entity/event_entity.dart';
import '../../data/network/models/entity/tour_entity.dart';
import '../../domain/services/events_service.dart';
import '../../domain/services/excursions_service.dart';

class PlacesPageViewModel with ChangeNotifier {
  final EventsService eventsService;
  final ExcursionsService excursionsService;

  int _excursionOffset = 1;

  late ScrollController _excursionController;
  ScrollController get excursionController => _excursionController;

  List<EventsEntity> _events = [];
  List<EventsEntity> get events => _events;

  final List<TourEntity> _excursions = [];
  List<TourEntity> get excursions {
    // _excursions.sort((a, b) => b.reviewCount.compareTo(a.reviewCount));
    return _excursions;
  }

  bool _excursionsHasNextPage = true;

  bool _isLocationsLoading = false;
  bool get isLocationsLoading => _isLocationsLoading;

  bool _isExcursionsLoading = false;
  bool get isExcursionsLoading => _isExcursionsLoading;

  bool _isExcursionsLoadingMore = false;
  bool get isExcursionsLoadingMore => _isExcursionsLoadingMore;

  bool _isEventsLoading = false;
  bool get isEventsLoading => _isEventsLoading;

  PageController? _controller;
  PageController? get controller => _controller;

  int _pageIndex = 0;
  int get pageIndex => _pageIndex;

  PlacesPageViewModel({required this.eventsService, required this.excursionsService}) {
    _controller = PageController();
    _excursionController = ScrollController();
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
    final response = await excursionsService.getTours(_excursionOffset);
    response.fold((result) {
      _excursionsHasNextPage = result.next == null ? false : true;
      _excursions.addAll(result.results);
      _excursionOffset++;
      print(_excursions.length);
    }, (exception, error) {});
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
