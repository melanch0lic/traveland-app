import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:geolocator/geolocator.dart';
import 'package:latlong2/latlong.dart';

import '../../data/network/models/coordinates_request_body.dart';
import '../../data/network/models/entity/housing_entity.dart';
import '../../domain/repositories/cache_data_repository.dart';
import '../../domain/services/osrm_service.dart';

enum PlaceType { housing, location, event }

enum RouteType { driving, foot }

class MapPageViewModel with ChangeNotifier {
  final OsrmService osrmService;
  final CachedDataRepository cachedDataRepository;

  late final StreamSubscription subscription;

  late final TextEditingController _searchController;
  TextEditingController get searchController => _searchController;

  final _focusNode = FocusNode();
  FocusNode get focusNode => _focusNode;

  List<dynamic> searchObjects = [];

  final List<String> _items = ['Item 1', 'Item 2', 'Item 3', 'Item 4'];
  List<String> get items => _items;

  void onReorderHandle(int oldIndex, int newIndex) {
    if (newIndex > oldIndex) {
      newIndex -= 1;
    }
    final item = _items.removeAt(oldIndex);
    _items.insert(newIndex, item);
    print(_items);
    notifyListeners();
  }

  PlaceType? _selectedPlaceType;
  PlaceType? get selectedPlaceType => _selectedPlaceType;

  RouteType _selectedRouteType = RouteType.driving;
  RouteType get selectedRouteType => _selectedRouteType;

  LatLng? _selectedPosition;

  final List<LatLng> _selectedPositions = [];
  List<LatLng> get selectedPositions => _selectedPositions;

  List<LatLng> _polylinePoints = [];
  List<LatLng> get polylinePoints => _polylinePoints;

  HousingEntity? _selectedHousing;
  HousingEntity? get selectedHousing => _selectedHousing;

  dynamic _selectedPlace;
  dynamic get selectedPlace => _selectedPlace;

  bool _isSearchOpened = false;
  bool get isSearchOpened => _isSearchOpened;

  bool _isRouteWindowOpened = false;
  bool get isRouteWindowOpened => _isRouteWindowOpened;

  void changeSearchState() {
    _isSearchOpened = !_isSearchOpened;
    notifyListeners();
    if (_isSearchOpened) {
      Future.delayed(const Duration(milliseconds: 500)).whenComplete(() => _focusNode.requestFocus());
    }
  }

  Future<void> onSearchTextChange() async {
    final response = await osrmService.getAllPlacesBySearch(searchController.text == '' ? ' ' : searchController.text);
    response.fold((result) {
      final newList = [];

      newList.addAll(result.result.places.housings);
      newList.addAll(result.result.places.locations);
      newList.addAll(result.result.places.events);

      searchObjects = newList;
      notifyListeners();
    }, (exception, error) {});
  }

  void onBackRouteButtonPressed() {
    _isRouteWindowOpened = false;
    _selectedPositions.clear();
    _polylinePoints.clear();
    notifyListeners();
  }

  void setDrivingRouteType() {
    _selectedRouteType = RouteType.driving;
    notifyListeners();
  }

  void setFootRouteType() {
    _selectedRouteType = RouteType.foot;
    notifyListeners();
  }

  List<Marker> get locationMarkers => cachedDataRepository.placesList!
      .map(
        (e) => Marker(
          width: 40,
          height: 40,
          point: LatLng(e.placeInfo.longitude.value, e.placeInfo.latitude.value),
          builder: (ctx) => IconButton(
            icon: _selectedPlace != null
                ? _selectedPlace!.placeInfo.id == e.placeInfo.id
                    ? SvgPicture.asset(
                        'assets/images/location_marker_icon.svg',
                      )
                    : SvgPicture.asset('assets/images/marker_icon.svg')
                : SvgPicture.asset('assets/images/marker_icon.svg'),
            onPressed: () {
              _selectedPlace = e;
              changeSelectedPosition(LatLng(e.placeInfo.longitude.value, e.placeInfo.latitude.value));
              notifyListeners();
            },
          ),
        ),
      )
      .toList();

  List<Marker> get housingMarkers => cachedDataRepository.housingList!
      .map(
        (e) => Marker(
          width: 40,
          height: 40,
          point: LatLng(e.placeInfo.longitude.value, e.placeInfo.latitude.value),
          builder: (ctx) => IconButton(
            icon: _selectedPlace != null
                ? _selectedPlace!.placeInfo.id == e.placeInfo.id
                    ? SvgPicture.asset(
                        'assets/images/location_marker_icon.svg',
                      )
                    : SvgPicture.asset('assets/images/marker_icon.svg')
                : SvgPicture.asset('assets/images/marker_icon.svg'),
            onPressed: () {
              _selectedPlace = e;
              changeSelectedPosition(LatLng(e.placeInfo.longitude.value, e.placeInfo.latitude.value));
              notifyListeners();
            },
          ),
        ),
      )
      .toList();

  List<Marker> get eventMarkers => cachedDataRepository.eventList!
      .map(
        (e) => Marker(
          width: 40,
          height: 40,
          point: LatLng(e.placeInfo.longitude.value, e.placeInfo.latitude.value),
          builder: (ctx) => IconButton(
            icon: _selectedPlace != null
                ? _selectedPlace!.placeInfo.id == e.placeInfo.id
                    ? SvgPicture.asset(
                        'assets/images/location_marker_icon.svg',
                      )
                    : SvgPicture.asset('assets/images/marker_icon.svg')
                : SvgPicture.asset('assets/images/marker_icon.svg'),
            onPressed: () {
              _selectedPlace = e;
              changeSelectedPosition(LatLng(e.placeInfo.longitude.value, e.placeInfo.latitude.value));
              notifyListeners();
            },
          ),
        ),
      )
      .toList();

  late MapController _mapController;
  MapController get mapController => _mapController;

  LatLng? _currentLocationPosition;
  LatLng? get currentLocationPosition => _currentLocationPosition;

  MapPageViewModel(this.osrmService, this.cachedDataRepository) {
    init();
  }

  Future<void> init() async {
    _searchController = TextEditingController();
    _mapController = MapController();
    await _getCurrentLocation();
    _liveLocation();
  }

  Future<void> _fetchRouteFromOrsm() async {
    final response = await osrmService.getRouteFromOsrm(
        CoordinatesRequestBody(coordinates: [
          [_currentLocationPosition!.longitude, _currentLocationPosition!.latitude],
          ..._selectedPositions.map((e) => [e.longitude, e.latitude]).toList()
        ]),
        // '${_currentLocationPosition!.longitude},${_currentLocationPosition!.latitude}',
        // '${_selectedPosition!.longitude},${_selectedPosition!.latitude}',
        _selectedRouteType == RouteType.driving ? 'driving-car' : 'foot-walking');
    response.fold((result) {
      _polylinePoints = result.routes.first.geometry.coordinates.map((e) => LatLng(e[1], e[0])).toList();
    }, (exception, error) {});
  }

  Future<void> _getCurrentLocation() async {
    final bool serviceEnabled = await Geolocator.isLocationServiceEnabled();

    if (!serviceEnabled) {
      return Future.error('Location services are disabled');
    }

    LocationPermission permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        return Future.error('Location permissions are denied');
      }
    }

    final Position currentPosition = await Geolocator.getCurrentPosition();
    _currentLocationPosition = LatLng(currentPosition.latitude, currentPosition.longitude);
    _mapController.move(_currentLocationPosition!, 17);
    notifyListeners();
  }

  void onSelectHousingCategoryButtonPressed() {
    _selectedPlaceType = PlaceType.housing;
    notifyListeners();
  }

  void onSelectLocationCategoryButtonPressed() {
    _selectedPlaceType = PlaceType.location;
    notifyListeners();
  }

  void onSelectEventCategoryButtonPressed() {
    _selectedPlaceType = PlaceType.event;
    notifyListeners();
  }

  Future<void> onSelectDrivingRouteButtonPressed() async {
    _selectedRouteType = RouteType.driving;
    await _fetchRouteFromOrsm().whenComplete(() => notifyListeners());
  }

  Future<void> onSelectFootRouteButtonPressed() async {
    _selectedRouteType = RouteType.foot;
    await _fetchRouteFromOrsm().whenComplete(() => notifyListeners());
  }

  Future<void> onLocationButtonPressed() async {
    await _getCurrentLocation();
  }

  Future<void> onDrawRouteButtonPressed() async {
    if (!_selectedPositions.contains(_selectedPosition)) {
      _selectedPositions.add(_selectedPosition!);
    }
    await _fetchRouteFromOrsm().whenComplete(() {
      _isRouteWindowOpened = true;
      notifyListeners();
    });
  }

  void _liveLocation() {
    const LocationSettings locationSettings = LocationSettings(
      accuracy: LocationAccuracy.high,
    );

    subscription = Geolocator.getPositionStream(locationSettings: locationSettings).listen((Position position) async {
      if ((_currentLocationPosition!.latitude - position.latitude).abs() > 0.00015 ||
          (_currentLocationPosition!.longitude - position.longitude).abs() > 0.00015) {
        _currentLocationPosition = LatLng(position.latitude, position.longitude);
        if (_selectedPositions.isNotEmpty) {
          await _fetchRouteFromOrsm();
        }
        notifyListeners();
      }
      if (_selectedPositions.isNotEmpty) {
        if ((_selectedPositions[0].latitude - position.latitude).abs() < 0.0015 &&
            (_selectedPositions[0].longitude - position.longitude).abs() < 0.0015) {
          _polylinePoints.clear();
          _selectedPositions.removeAt(0);
        }
      }
    });
  }

  void changeSelectedPosition(LatLng point) {
    if (!_selectedPositions.contains(point)) {
      _isRouteWindowOpened = false;
    }
    _selectedPosition = point;
    notifyListeners();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  void increaseCurrentZoomLevel() {
    if (mapController.zoom < 16) {
      final bounds = _mapController.bounds;
      final centerZoom = _mapController.centerZoomFitBounds(bounds!);
      if (mapController.zoom > 17) {
        _mapController.move(centerZoom.center, 17);
      } else {
        _mapController.move(centerZoom.center, mapController.zoom + 1);
      }
    }
  }

  void reduceCurrentZoomLevel() {
    if (mapController.zoom > 9) {
      final bounds = _mapController.bounds;
      final centerZoom = _mapController.centerZoomFitBounds(bounds!);
      if (mapController.zoom < 8) {
        _mapController.move(centerZoom.center, 8);
      } else {
        _mapController.move(centerZoom.center, mapController.zoom - 1);
      }
    }
  }
}
