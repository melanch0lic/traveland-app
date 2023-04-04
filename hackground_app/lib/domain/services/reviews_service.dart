import '../../data/network/main_api_client.dart';
import '../../data/network/models/add_review_request_body.dart';
import '../../data/network/models/response/add_review_response.dart';
import '../../data/network/models/response/reviews_api_response.dart';
import '../../data/network/result.dart';

class ReviewsService {
  final MainApiClient mainApiClient;

  ReviewsService({required this.mainApiClient});

  Future<Result<ReviewsApiResponse>> getReviews(int placeId) async {
    final response = await mainApiClient.getReviews(placeId);
    return response;
  }

  Future<void> deleteReview(int id) async {
    await mainApiClient.deleteReview(id);
  }

  Future<Result<AddReviewResponse>> addReview(AddReviewRequestBody body) async {
    final response = await mainApiClient.addReview(body);
    return response;
  }
}
