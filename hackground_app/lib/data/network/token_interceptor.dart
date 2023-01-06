import 'package:dio/dio.dart';

import 'session_data.dart';

class TokenInterceptor extends QueuedInterceptor {
  final Dio dio;
  final SessionData sessionData;
  DateTime? _lastRetryTime;

  TokenInterceptor({required this.dio, required this.sessionData});

  @override
  Future<void> onRequest(RequestOptions options, RequestInterceptorHandler handler) async {
    final token = await sessionData.getJwtToken();
    options.headers.addAll({'Authorization': 'Bearer $token'});
    super.onRequest(options, handler);
  }
}
