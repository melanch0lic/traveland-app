import 'package:dio/dio.dart';

import 'api_error.dart';
import 'main_api_client.dart';
import 'models/add_review_request_body.dart';
import 'models/coordinates_request_body.dart';
import 'models/login_request_body.dart';
import 'models/register_request_body.dart';
import 'models/response/add_review_response.dart';
import 'models/response/events_response.dart';
import 'models/response/housing_response.dart';
import 'models/response/login_response.dart';
import 'models/response/orsm_route_response.dart';
import 'models/response/places_response.dart';
import 'models/response/register_response.dart';
import 'models/response/reviews_api_response.dart';
import 'models/response/search_response.dart';
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
  Future<Result<PlacesResponse>> getPlaces(String sortBy, String sortOrder, int placeTypeId) {
    return _wrapUnsafeCall<PlacesResponse>(() => _client.getPlaces(sortBy, sortOrder, placeTypeId));
  }

  @override
  Future<Result<EventsResponse>> getEvents(String sortBy, String sortOrder, int placeTypeId) {
    return _wrapUnsafeCall<EventsResponse>(() => _client.getEvents(sortBy, sortOrder, placeTypeId));
  }

  @override
  Future<Result<HousingResponse>> getHousings(String sortBy, String sortOrder, int houseTypeId) {
    return _wrapUnsafeCall<HousingResponse>(() => _client.getHousings(sortBy, sortOrder, houseTypeId));
  }

  @override
  Future<Result<ReviewsApiResponse>> getReviews(int placeId) {
    return _wrapUnsafeCall<ReviewsApiResponse>(() => _client.getReviews(placeId));
  }

  @override
  Future<Result<UserByIdResponse>> getUserInfoById() {
    return _wrapUnsafeCall<UserByIdResponse>(() => _client.getUserInfoById());
  }

  @override
  Future<Result<OsrmRouteResponse>> getRouteFromOsrm(CoordinatesRequestBody coordinates, String routeType) {
    return _wrapUnsafeCall<OsrmRouteResponse>(() => _client.getRouteFromOsrm(coordinates, routeType));
  }

  @override
  Future<Result<SearchResponse>> getAllPlacesBySearch(String searchText) {
    return _wrapUnsafeCall<SearchResponse>(() => _client.getAllPlacesBySearch(searchText));
  }

  @override
  Future<Result<AddReviewResponse>> addReview(AddReviewRequestBody body) {
    return _wrapUnsafeCall<AddReviewResponse>(() => _client.addReview(body));
  }

  Future<Result<T>> _wrapUnsafeCall<T>(UnsafeCall<T> call) async {
    try {
      return await call();
    } catch (exception) {
      if (exception is DioError) {
        ApiError? apiError;
        if (exception.response != null) {
          apiError = ApiError.fromJson({'code': exception.response!.statusCode, 'msg': exception.message});
        }
        return Future(() => Failure(exception: exception, error: apiError));
      }
      return Future(() => Failure(exception: exception as Exception));
    }
  }
}
