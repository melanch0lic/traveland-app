import '../../data/network/main_api_client.dart';
import '../../data/network/models/response/housing_response.dart';
import '../../data/network/result.dart';

class HousingService {
  final MainApiClient mainApiClient;

  HousingService({required this.mainApiClient});

  Future<Result<HousingResponse>> getHousings(String sortBy, String sortOrder, int houseTypeId) async {
    final response = await mainApiClient.getHousings(sortBy, sortOrder, houseTypeId);
    return response;
  }
}
