import '../../data/network/main_api_client.dart';
import '../../data/network/models/response/places_response.dart';
import '../../data/network/models/response/reviews_api_response.dart';
import '../../data/network/result.dart';

class PlacesService {
  final MainApiClient mainApiClient;

  PlacesService({required this.mainApiClient});

  Future<Result<PlacesResponse>> getPlaces() async {
    final response = await mainApiClient.getPlaces();
    return response;
  }

  Future<Result<ReviewsApiResponse>> getReviews(int placeId) async {
    final response = await mainApiClient.getReviews(placeId);
    return response;
  }
}
