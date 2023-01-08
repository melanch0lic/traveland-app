import 'package:dio/dio.dart';
import 'package:retrofit/retrofit.dart';

import 'models/response/tours_response.dart';
import 'result.dart';

part 'tripster_api_client.g.dart';

@RestApi(baseUrl: 'https://experience.tripster.ru/api')
abstract class TripsterApiClient {
  factory TripsterApiClient(Dio dio) {
    dio.options = BaseOptions(
      receiveTimeout: 30000,
      connectTimeout: 30000,
      contentType: 'application/json',
      headers: {
        'Authorization': 'Token ff2f21fc52fe5be5c4f799b262cbe4ee65820e52',
        'Content-Type': 'application/json',
      },
    );

    return _TripsterApiClient(dio);
  }

  @GET(
      '/experiences/?city__name_ru=Владикавказ&detailed=true&exp_partner=t978916&utm_campaign=affiliates&utm_medium=api&utm_source=t978916&page={page}')
  Future<Result<ToursResponse>> getTours(@Path() int page);
}
