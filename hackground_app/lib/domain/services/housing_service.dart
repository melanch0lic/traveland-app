import '../../data/network/main_api_client.dart';
import '../../data/network/models/response/housing_response.dart';
import '../../data/network/models/response/reviews_api_response.dart';
import '../../data/network/result.dart';

class HousingService {
  final MainApiClient mainApiClient;

  HousingService({required this.mainApiClient});

  Future<Result<HousingResponse>> getHousings() async {
    final response = await mainApiClient.getHousings();
    return response;
  }

  Future<Result<ReviewsApiResponse>> getReviews(int placeId) async {
    final response = await mainApiClient.getReviews(placeId);
    return response;
  }
}
