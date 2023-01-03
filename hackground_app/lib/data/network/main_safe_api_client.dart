import 'package:dio/dio.dart';

import 'api_error.dart';
import 'main_api_client.dart';
import 'models/login_request_body.dart';
import 'models/response/locals_response.dart';
import 'models/response/login_response.dart';
import 'models/response/register_response.dart';
import 'register_request_body.dart';
import 'result.dart';

typedef UnsafeCall<T> = Future<Result<T>> Function();

class MainSafeApiClient implements MainApiClient {
  final MainApiClient _client;

  MainSafeApiClient(this._client);

  @override
  Future<Result<LoginResponse>> login(LoginRequestBody body) {
    return _wrapUnsafeCall<LoginResponse>(() => _client.login(body));
  }

  @override
  Future<Result<RegisterResponse>> registerUser(RegisterRequestBody body) {
    return _wrapUnsafeCall<RegisterResponse>(() => _client.registerUser(body));
  }

  @override
  Future<Result<LocalsResponse>> getEvents() {
    return _wrapUnsafeCall<LocalsResponse>(() => _client.getEvents());
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
