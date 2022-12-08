import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/network/models/entity/tour_entity.dart';
import '../../data/network/tripster_api_client.dart';

class ToursPageViewModel with ChangeNotifier {
  final Dio _dio = Dio();
  late TripsterApiService tripsterApiService;
  List<TourEntity>? tours;

  int _offset = 2;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ToursPageViewModel() {
    init();
  }

  Future<void> fetchTripsterTours() async {
    final response = await tripsterApiService.getTours(_offset);
    response.fold((result) {
      if (result.next != null) {
        _offset += 1;
      }
      tours = result.results;
      print(result.count);
      print(result.results[0].title);
    }, (exception, error) {});
  }

  Future<void> init() async {
    _dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    tripsterApiService = TripsterApiService(_dio);
    _isLoading = true;
    notifyListeners();

    await fetchTripsterTours();

    _isLoading = false;
    notifyListeners();
  }
}
