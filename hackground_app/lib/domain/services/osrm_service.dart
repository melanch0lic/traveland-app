import '../../data/network/main_api_client.dart';
import '../../data/network/models/response/orsm_route_response.dart';
import '../../data/network/result.dart';

class OsrmService {
  final MainApiClient mainApiClient;

  OsrmService({required this.mainApiClient});

  Future<Result<OsrmRouteResponse>> getRouteFromOsrm(String start, String finish, String routeType) async {
    final response = await mainApiClient.getRouteFromOsrm(start, finish, routeType);
    return response;
  }
}
