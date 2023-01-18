import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

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

  Future<void> initializeApp() async {
    _dioTripster = Dio();
    _dioMainApiClient = Dio();
    _tripsterApiClient = _createTripsterApiClient(_dioTripster);
    _mainApiClient = _createMainApiClient(_dioMainApiClient);
    _appRouter = AppRouter();
    _cachedDataRepository = CachedDataRepository();
    _sessionData = const SessionData(FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)));
    _authService = AuthService(sessionData: _sessionData, mainApiClient: _mainApiClient);
    _eventsService = EventsService(mainApiClient: _mainApiClient);
    _excursionsService = ExcursionsService(tripsterApiClient: _tripsterApiClient);
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
