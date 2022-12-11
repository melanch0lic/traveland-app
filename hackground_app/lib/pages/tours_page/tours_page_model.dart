import 'package:flutter/material.dart';

import '../../data/network/models/entity/tour_entity.dart';
import '../../data/network/tripster_api_client.dart';

class ToursPageViewModel with ChangeNotifier {
  final TripsterApiService tripsterApiService;
  List<TourEntity>? tours;

  int _offset = 2;

  bool _isLoading = false;

  bool get isLoading => _isLoading;

  ToursPageViewModel({required this.tripsterApiService}) {
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
    _isLoading = true;
    notifyListeners();

    await fetchTripsterTours();

    _isLoading = false;
    notifyListeners();
  }
}
