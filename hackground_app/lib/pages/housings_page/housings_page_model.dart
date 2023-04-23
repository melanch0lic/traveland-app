import 'dart:io';

import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

import '../../data/network/models/entity/housing_entity.dart';
import '../../domain/services/housing_service.dart';

enum CategoryHousingMode { all, hotel, guestHouse, hostel, private, tourbase }

class HousingsPageViewModel with ChangeNotifier {
  final HousingService housingService;
  HousingsPageViewModel(this.housingService) {
    _housingController = ScrollController();
    init();
  }

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  bool _isConnected = true;
  bool get isConnected => _isConnected;

  bool _isHousingsButtonShow = false;
  bool get isHousingsButtonShow => _isHousingsButtonShow;

  late ScrollController _housingController;
  ScrollController get housingController => _housingController;

  List<HousingEntity> _housings = [];
  List<HousingEntity> get housings => _housings;

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await fetchHousingsData();

    if (housings.isNotEmpty) {
      _isConnected = true;
    }

    _housingController.addListener(() {
      if (_housingController.position.extentBefore > 300) {
        _isHousingsButtonShow = true;
        notifyListeners();
      } else {
        _isHousingsButtonShow = false;
        notifyListeners();
      }
    });

    _isLoading = false;
    notifyListeners();
  }

  CategoryHousingMode _currentHousingCategoryMode = CategoryHousingMode.all;
  CategoryHousingMode get currentCategoryMode => _currentHousingCategoryMode;

  void onLocationCategoryChanged(CategoryHousingMode categoryMode) {
    _currentHousingCategoryMode = categoryMode;
    notifyListeners();
  }

  bool _sortFlag = false;
  bool get sortFlag => _sortFlag;

  String _sortByHousings = 'name';
  String get sortByHousings => _sortByHousings;
  String _sortOrderHousings = 'asc';
  int _placeTypeId = 0;

  Future<void> sortPlacesParametersChange(String sortBy, String sortOrder) async {
    _isLoading = true;
    notifyListeners();

    _sortByHousings = sortBy;
    _sortOrderHousings = sortOrder;
    await fetchHousingsData();

    _sortFlag = false;
    _isLoading = false;
    notifyListeners();
  }

  Future<void> placeTypeIdChange(CategoryHousingMode categoryMode) async {
    _isLoading = true;
    notifyListeners();
    switch (categoryMode) {
      case CategoryHousingMode.all:
        _placeTypeId = 0;
        break;
      case CategoryHousingMode.hotel:
        _placeTypeId = 1;
        break;
      case CategoryHousingMode.guestHouse:
        _placeTypeId = 2;
        break;
      case CategoryHousingMode.hostel:
        _placeTypeId = 3;
        break;
      case CategoryHousingMode.tourbase:
        _placeTypeId = 4;
        break;
      case CategoryHousingMode.private:
        _placeTypeId = 0;
        break;
    }
    await fetchHousingsData();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchHousingsData() async {
    final response = await housingService.getHousings(_sortByHousings, _sortOrderHousings, _placeTypeId);
    response.fold((result) {
      _housings = result.result.places;
    }, (exception, error) {
      _checkError(exception);
    });
  }

  void onSortFlagPressed() {
    _sortFlag = !_sortFlag;
    notifyListeners();
  }

  void _checkError(dynamic exception) {
    if (exception is DioError) {
      _isConnected = exception.error is SocketException ? false : true;
    } else {
      _isConnected = true;
    }
  }
}
