import 'package:dio/dio.dart';

import 'api_error.dart';
import 'models/response/tours_response.dart';
import 'result.dart';
import 'tripster_api_client.dart';

typedef UnsafeCall<T> = Future<Result<T>> Function();

class TripsterSafeApiClient implements TripsterApiClient {
  final TripsterApiClient _client;

  TripsterSafeApiClient(this._client);

  @override
  Future<Result<ToursResponse>> getTours(int page) {
    return _wrapUnsafeCall<ToursResponse>(() => _client.getTours(page));
  }

  Future<Result<T>> _wrapUnsafeCall<T>(UnsafeCall<T> call) async {
    try {
      return await call();
    } catch (exception) {
      if (exception is DioError) {
        ApiError? apiError;
        if (exception.response != null) {
          apiError = ApiError.fromJson(exception.response!.data['error']);
        }
        return Future(() => Failure(exception: exception, error: apiError));
      }
      return Future(() => Failure(exception: exception as Exception));
    }
  }
}
