import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

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

part 'main_api_client.g.dart';

@RestApi(baseUrl: 'http://176.119.159.9:')
abstract class MainApiClient {
  factory MainApiClient(Dio dio) = _MainApiClient;

  @POST('5555/auth/sign-in')
  Future<Result<LoginResponse>> login(@Body() LoginRequestBody body);

  @POST('5555/auth/sign-up')
  Future<Result<RegisterResponse>> registerUser(@Body() RegisterRequestBody body);

  @GET('5555/api/place/get-all-place/3?limit=200&sort_by={sortBy}&sort_order={sortOrder}&place_type_id={placeTypeId}')
  Future<Result<PlacesResponse>> getPlaces(@Path() String sortBy, @Path() String sortOrder, @Path() int placeTypeId);

  @GET('5555/api/place/get-all-place/2?limit=200&sort_by={sortBy}&sort_order={sortOrder}&place_type_id={placeTypeId}')
  Future<Result<EventsResponse>> getEvents(@Path() String sortBy, @Path() String sortOrder, @Path() int placeTypeId);

  @GET('5555/api/place/get-all-place/1?limit=200&sort_by={sortBy}&sort_order={sortOrder}&house_type_id={houseTypeId}')
  Future<Result<HousingResponse>> getHousings(@Path() String sortBy, @Path() String sortOrder, @Path() int houseTypeId);

  @GET('5555/api/review/get-all-reviews?place_id={placeId}')
  Future<Result<ReviewsApiResponse>> getReviews(@Path() int placeId);

  @GET('5555/api/user/get-user/')
  Future<Result<UserByIdResponse>> getUserInfoById();

  @GET('5555/api/place/get-all-places-by-search/{searchText}')
  Future<Result<SearchResponse>> getAllPlacesBySearch(@Path() String searchText);

  @POST('5555/api/review/add-review/')
  Future<Result<AddReviewResponse>> addReview(@Body() AddReviewRequestBody body);

  @DELETE('5555/api/review/delete-review/{id}')
  Future<void> deleteReview(@Path() int id);

  @POST('5000/ors/v2/directions/{routeType}/geojson')
  Future<Result<OsrmRouteResponse>> getRouteFromOsrm(
      @Body() CoordinatesRequestBody coordinates, @Path() String routeType);
}
