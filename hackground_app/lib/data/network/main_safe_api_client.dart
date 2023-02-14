import 'package:dio/dio.dart';

import 'api_error.dart';
import 'main_api_client.dart';
import 'models/coordinates_request_body.dart';
import 'models/login_request_body.dart';
import 'models/register_request_body.dart';
import 'models/response/events_response.dart';
import 'models/response/housing_response.dart';
import 'models/response/login_response.dart';
import 'models/response/orsm_route_response.dart';
import 'models/response/places_response.dart';
import 'models/response/register_response.dart';
import 'models/response/user_by_id_response.dart';
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
  Future<Result<PlacesResponse>> getPlaces() {
    return _wrapUnsafeCall<PlacesResponse>(() => _client.getPlaces());
  }

  @override
  Future<Result<EventsResponse>> getEvents() {
    return _wrapUnsafeCall<EventsResponse>(() => _client.getEvents());
  }

  @override
  Future<Result<HousingResponse>> getHousings() {
    return _wrapUnsafeCall<HousingResponse>(() => _client.getHousings());
  }

  @override
  Future<Result<UserByIdResponse>> getUserInfoById() {
    return _wrapUnsafeCall<UserByIdResponse>(() => _client.getUserInfoById());
  }

  @override
  Future<Result<OsrmRouteResponse>> getRouteFromOsrm(CoordinatesRequestBody coordinates, String routeType) {
    return _wrapUnsafeCall<OsrmRouteResponse>(() => _client.getRouteFromOsrm(coordinates, routeType));
  }

  Future<Result<T>> _wrapUnsafeCall<T>(UnsafeCall<T> call) async {
    try {
      return await call();
    } catch (exception) {
      if (exception is DioError) {
        ApiError? apiError;
        if (exception.response != null) {
          if (exception.response!.data['error'] != null) {
            apiError = ApiError.fromJson(exception.response!.data['error']);
          }
        }
        return Future(() => Failure(exception: exception, error: apiError));
      }
      return Future(() => Failure(exception: exception as Exception));
    }
  }
}
