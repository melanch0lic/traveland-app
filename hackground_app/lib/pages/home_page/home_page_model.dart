import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/cupertino.dart';

import '../../data/network/models/entity/event_entity.dart';
import '../../data/network/models/entity/housing_entity.dart';
import '../../data/network/models/entity/place_entity.dart';
import '../../data/network/models/entity/tour_entity.dart';
import '../../domain/repositories/cache_data_repository.dart';
import '../../domain/services/events_service.dart';
import '../../domain/services/excursions_service.dart';
import '../../domain/services/housing_service.dart';
import '../../domain/services/places_service.dart';

class HomePageViewModel with ChangeNotifier {
  final EventsService eventsService;
  final ExcursionsService excursionsService;
  final HousingService housingService;
  final PlacesService placesService;
  final CachedDataRepository cachedDataRepository;

  List<EventsEntity>? get eventList => cachedDataRepository.eventList;
  List<TourEntity>? get excursionList => cachedDataRepository.excursionList;
  List<HousingEntity>? get housingList => cachedDataRepository.housingList;
  List<PlaceEntity>? get placesList => cachedDataRepository.placesList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isConnected = true;
  bool get isConnected => _isConnected;

  HomePageViewModel(
      {required this.cachedDataRepository,
      required this.eventsService,
      required this.excursionsService,
      required this.placesService,
      required this.housingService}) {
    init();
  }

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await Future.wait([
      fetchExcursionsData(),
      fetchHousingsData(),
      fetchPlacesData(),
      fetchEventsData(),
    ]);

    _isLoading = false;
    notifyListeners();
  }

  void _checkError(dynamic exception) {
    if (exception is DioError) {
      _isConnected = exception.error is SocketException ? false : true;
    } else {
      _isConnected = true;
    }
  }

  Future<void> fetchEventsData() async {
    final response = await eventsService.getEvents('name', 'asc', 0);
    response.fold((result) {
      cachedDataRepository.eventList = result.result.places;
    }, (exception, error) {
      _checkError(exception);
      cachedDataRepository.eventList = [];
    });
  }

  Future<void> fetchPlacesData() async {
    final response = await placesService.getPlaces('name', 'asc', 0);
    response.fold((result) {
      cachedDataRepository.placesList = result.result.places;
    }, (exception, error) {
      _checkError(exception);
      cachedDataRepository.placesList = [];
    });
  }

  Future<void> fetchHousingsData() async {
    final response = await housingService.getHousings('name', 'asc', 0);
    response.fold((result) {
      cachedDataRepository.housingList = result.result.places;
    }, (exception, error) {
      _checkError(exception);
      cachedDataRepository.housingList = [];
    });
  }

  Future<void> fetchExcursionsData() async {
    final response = await excursionsService.getTours(1);
    response.fold((result) {
      cachedDataRepository.excursionList = result.results;
    }, (exception, error) {
      _checkError(exception);
      cachedDataRepository.excursionList = [];
    });
  }
}
