import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/login_request_body.dart';
import 'models/response/events_response.dart';
import 'models/response/housing_response.dart';
import 'models/response/login_response.dart';
import 'models/response/orsm_route_response.dart';
import 'models/response/places_response.dart';
import 'models/response/register_response.dart';
import 'models/response/user_by_id_response.dart';
import 'register_request_body.dart';
import 'result.dart';

part 'main_api_client.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8000/')
abstract class MainApiClient {
  factory MainApiClient(Dio dio) = _MainApiClient;

  @POST('auth/sign-in')
  Future<Result<LoginResponse>> login(@Body() LoginRequestBody body);

  @POST('auth/sign-up')
  Future<Result<RegisterResponse>> registerUser(@Body() RegisterRequestBody body);

  @GET('api/place/get-all-place/3')
  Future<Result<PlacesResponse>> getPlaces();

  @GET('api/place/get-all-place/2')
  Future<Result<EventsResponse>> getEvents();

  @GET('api/place/get-all-place/1')
  Future<Result<HousingResponse>> getHousings();

  @GET('api/user/get-user/')
  Future<Result<UserByIdResponse>> getUserInfoById();

  @GET('route/v1/car/44.6714,43.0446;44.6615,43.0392?steps=true')
  Future<Result<OrsmRouteResponse>> getRouteFromOsrm();
}
