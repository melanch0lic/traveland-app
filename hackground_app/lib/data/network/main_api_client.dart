import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/login_request_body.dart';
import 'models/response/login_response.dart';
import 'models/response/register_response.dart';
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
}