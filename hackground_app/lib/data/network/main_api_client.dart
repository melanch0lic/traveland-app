import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/login_request_body.dart';
import 'models/response/login_response.dart';
import 'result.dart';

part 'main_api_client.g.dart';

@RestApi(baseUrl: 'http://10.0.2.2:8000/')
abstract class MainApiClient {
  factory MainApiClient(Dio dio) = _MainApiClient;

  @POST('auth/sign-in')
  Future<Result<LoginResponse>> login(@Body() LoginRequestBody body);
}
