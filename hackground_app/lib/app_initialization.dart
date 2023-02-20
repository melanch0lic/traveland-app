import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'data/network/main_api_client.dart';
import 'data/network/main_safe_api_client.dart';
import 'data/network/session_data.dart';
import 'data/network/token_interceptor.dart';
import 'data/network/tripster_api_client.dart';
import 'data/network/tripster_safe_api_client.dart';
import 'domain/repositories/cache_data_repository.dart';
import 'domain/services/auth_service.dart';
import 'domain/services/events_service.dart';
import 'domain/services/excursions_service.dart';
import 'domain/services/housing_service.dart';
import 'domain/services/osrm_service.dart';
import 'domain/services/places_service.dart';
import 'domain/settings.dart';
import 'navigation/router.gr.dart';

class InitializeProvider with ChangeNotifier {
  late final Dio _dioTripster;
  late final Dio _dioMainApiClient;

  late final AppRouter _appRouter;
  AppRouter get appRouter => _appRouter;

  late final SessionData _sessionData;
  SessionData get sessionData => _sessionData;

  late CachedDataRepository _cachedDataRepository;
  CachedDataRepository get cachedDataRepository => _cachedDataRepository;

  late TripsterApiClient _tripsterApiClient;
  TripsterApiClient get tripsterApiService => _tripsterApiClient;

  late MainApiClient _mainApiClient;
  MainApiClient get mainApiClient => _mainApiClient;

  late AuthService _authService;
  AuthService get authService => _authService;

  late EventsService _eventsService;
  EventsService get eventsService => _eventsService;

  late ExcursionsService _excursionsService;
  ExcursionsService get excursionsService => _excursionsService;

  late HousingService _housingService;
  HousingService get housingService => _housingService;

  late PlacesService _placesService;
  PlacesService get placesService => _placesService;

  late OsrmService _osrmService;
  OsrmService get osrmService => _osrmService;

  late final SharedPreferences _sharedPreferences;
  SharedPreferences get sharedPreferences => _sharedPreferences;

  late final Settings _settings;
  Settings get settings => _settings;

  late final bool _isUserAuthorized;
  bool get isUserAuthorized => _isUserAuthorized && (_settings.getRememberUserMode ?? false);

  Future<void> initializeApp() async {
    _appRouter = AppRouter();
    _dioTripster = Dio();
    _dioMainApiClient = Dio();
    _tripsterApiClient = _createTripsterApiClient(_dioTripster);
    _mainApiClient = _createMainApiClient(_dioMainApiClient);
    _sharedPreferences = await SharedPreferences.getInstance();
    _settings = Settings(_sharedPreferences);
    _cachedDataRepository = CachedDataRepository();
    _sessionData = const SessionData(FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)));
    _authService = AuthService(sessionData: _sessionData, mainApiClient: _mainApiClient, settings: _settings);
    _eventsService = EventsService(mainApiClient: _mainApiClient);
    _housingService = HousingService(mainApiClient: _mainApiClient);
    _placesService = PlacesService(mainApiClient: _mainApiClient);
    _osrmService = OsrmService(mainApiClient: _mainApiClient);
    _excursionsService = ExcursionsService(tripsterApiClient: _tripsterApiClient);
    _isUserAuthorized = await _authService.isUserAuthorized();
    _dioMainApiClient.interceptors.add(TokenInterceptor(dio: _dioMainApiClient, sessionData: _sessionData));
  }

  TripsterSafeApiClient _createTripsterApiClient(Dio dio) {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return TripsterSafeApiClient(TripsterApiClient(dio));
  }

  MainSafeApiClient _createMainApiClient(Dio dio) {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return MainSafeApiClient(MainApiClient(dio));
  }
}
