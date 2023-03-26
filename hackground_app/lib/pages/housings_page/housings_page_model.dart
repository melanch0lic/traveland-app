import 'package:flutter/material.dart';

import '../../data/network/models/entity/housing_entity.dart';
import '../../domain/services/housing_service.dart';

class HousingsPageViewModel with ChangeNotifier {
  final HousingService housingService;
  HousingsPageViewModel(this.housingService) {
    init();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  List<HousingEntity> _housings = [];
  List<HousingEntity> get housings => _housings;

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await fetchHousingsData();

    _isLoading = false;
    notifyListeners();
  }

  bool _sortFlag = false;
  bool get sortFlag => _sortFlag;

  Future<void> fetchHousingsData() async {
    final response = await housingService.getHousings('name', 'asc', 0);
    response.fold((result) {
      _housings = result.result.places;
    }, (exception, error) {});
  }

  void onSortFlagPressed() {
    _sortFlag = !_sortFlag;
    notifyListeners();
  }
}
