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

@RestApi(baseUrl: 'http://176.119.159.9:')
abstract class MainApiClient {
  factory MainApiClient(Dio dio) = _MainApiClient;

  @POST('8000/auth/sign-in')
  Future<Result<LoginResponse>> login(@Body() LoginRequestBody body);

  @POST('8000/auth/sign-up')
  Future<Result<RegisterResponse>> registerUser(@Body() RegisterRequestBody body);

  @GET('8000/api/place/get-all-place/3')
  Future<Result<PlacesResponse>> getPlaces();

  @GET('8000/api/place/get-all-place/2')
  Future<Result<EventsResponse>> getEvents();

  @GET('8000/api/place/get-all-place/1')
  Future<Result<HousingResponse>> getHousings();

  @GET('8000/api/user/get-user/')
  Future<Result<UserByIdResponse>> getUserInfoById();

  @GET('http://10.0.2.2:5000/ors/v2/directions/{routeType}?start={start}&end={finish}')
  Future<Result<OsrmRouteResponse>> getRouteFromOsrm(
      @Path() String start, @Path() String finish, @Path() String routeType);
}
