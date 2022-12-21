import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';

import 'data/network/main_api_client.dart';
import 'data/network/main_safe_api_client.dart';
import 'data/network/session_data.dart';
import 'data/network/tripster_api_client.dart';
import 'data/network/tripster_safe_api_client.dart';
import 'domain/services/auth_service.dart';
import 'navigation/router.gr.dart';

class InitializeProvider with ChangeNotifier {
  late final Dio _dioTripster;
  late final Dio _dioMainApiClient;

  late final AppRouter _appRouter;
  AppRouter get appRouter => _appRouter;

  late final SessionData _sessionData;
  SessionData get sessionData => _sessionData;

  late TripsterApiService _tripsterApiService;
  TripsterApiService get tripsterApiService => _tripsterApiService;

  late MainApiClient _mainApiClient;
  MainApiClient get mainApiClient => _mainApiClient;

  late AuthService _authService;
  AuthService get authService => _authService;

  Future<void> initializeApp() async {
    _dioTripster = Dio();
    _dioMainApiClient = Dio();
    _tripsterApiService = _createTripsterApiClient(_dioTripster);
    _mainApiClient = _createMainApiClient(_dioMainApiClient);
    _appRouter = AppRouter();
    _sessionData = const SessionData(FlutterSecureStorage(aOptions: AndroidOptions(encryptedSharedPreferences: true)));
    _authService = AuthService(sessionData: _sessionData, mainApiClient: _mainApiClient);
  }

  TripsterSafeApiClient _createTripsterApiClient(Dio dio) {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return TripsterSafeApiClient(TripsterApiService(dio));
  }

  MainSafeApiClient _createMainApiClient(Dio dio) {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return MainSafeApiClient(MainApiClient(dio));
  }
}
