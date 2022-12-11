import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

import 'data/network/tripster_api_client.dart';
import 'data/network/tripster_safe_api_client.dart';
import 'navigation/router.gr.dart';

class InitializeProvider with ChangeNotifier {
  late final Dio _dio;

  late final AppRouter _appRouter;
  AppRouter get appRouter => _appRouter;

  late TripsterApiService _tripsterApiService;
  TripsterApiService get tripsterApiService => _tripsterApiService;

  Future<void> initializeApp() async {
    _dio = Dio();
    _tripsterApiService = _createTripsterApiClient(_dio);
    _appRouter = AppRouter();
  }

  TripsterSafeApiClient _createTripsterApiClient(Dio dio) {
    if (kDebugMode) {
      dio.interceptors.add(LogInterceptor(requestBody: true, responseBody: true));
    }
    return TripsterSafeApiClient(TripsterApiService(dio));
  }
}
