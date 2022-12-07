import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/network/models/entity/tour_entity.dart';
import '../../data/network/tripster_api_client.dart';

class ToursPageViewModel with ChangeNotifier {
  TripsterApiService tripsterApiService = TripsterApiService(Dio());
  List<TourEntity>? tours;

  int _offset = 2;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ToursPageViewModel() {
    init();
  }

  Future<void> fetchTripsterTours() async {
    final response = await tripsterApiService.getTours(_offset);
    if (response.next != null) {
      _offset += 1;
    }
    tours = response.results;
    print(response.count);
    print(response.results[0].title);
  }

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await fetchTripsterTours();

    _isLoading = false;
    notifyListeners();
  }
}
