import 'package:dio/dio.dart';

import '../../domain/services/auth_service.dart';
import 'session_data.dart';

class TokenInterceptor extends QueuedInterceptor {
  final Dio dio;
  final SessionData sessionData;
  final AuthService authService;
  DateTime? _lastRetryTime;

  TokenInterceptor({required this.dio, required this.sessionData, required this.authService});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await sessionData.getJwtToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});
    super.onRequest(options, handler);
  }

  @override
  Future<void> onError(DioError err, ErrorInterceptorHandler handler) async {
    if (err.error != null && err.response != null) {
      if (err.response!.statusCode == 401 || err.response!.statusCode == 419) {
        if (_lastRetryTime == null || DateTime.now().difference(_lastRetryTime!).inMinutes > 10) {
          await authService.refreshToken();
          _lastRetryTime = DateTime.now();
        }
        final token = await sessionData.getJwtToken();
        final requestOptions = err.requestOptions;
        final response = await dio.request(
          requestOptions.uri.toString(),
          queryParameters: requestOptions.queryParameters,
          options: Options(
            method: requestOptions.method,
            headers: {'Authorization': 'Bearer $token'},
            responseType: requestOptions.responseType,
            contentType: requestOptions.contentType,
            requestEncoder: requestOptions.requestEncoder,
            responseDecoder: requestOptions.responseDecoder,
          ),
        );
        handler.resolve(response);
        return;
      }
      // await FirebaseCrashlytics.instance.recordError(err, err.stackTrace, reason: 'A network error');
      super.onError(err, handler);
    } else {
      super.onError(err, handler);
    }
  }
}
