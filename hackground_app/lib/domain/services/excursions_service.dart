import '../../data/network/models/response/tours_response.dart';
import '../../data/network/result.dart';
import '../../data/network/tripster_api_client.dart';

class ExcursionsService {
  final TripsterApiClient tripsterApiClient;

  ExcursionsService({required this.tripsterApiClient});

  Future<Result<ToursResponse>> getTours(int page) async {
    final response = await tripsterApiClient.getTours(page);
    return response;
  }
}
