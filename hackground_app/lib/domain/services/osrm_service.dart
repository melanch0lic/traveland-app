import '../../data/network/main_api_client.dart';
import '../../data/network/models/coordinates_request_body.dart';
import '../../data/network/models/response/orsm_route_response.dart';
import '../../data/network/result.dart';

class OsrmService {
  final MainApiClient mainApiClient;

  OsrmService({required this.mainApiClient});

  Future<Result<OsrmRouteResponse>> getRouteFromOsrm(CoordinatesRequestBody coordinates, String routeType) async {
    final response = await mainApiClient.getRouteFromOsrm(coordinates, routeType);
    return response;
  }
}
