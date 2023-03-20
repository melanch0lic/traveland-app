import 'package:flutter/material.dart';

import '../../data/network/models/add_review_request_body.dart';
import '../../domain/services/reviews_service.dart';

class WriteReviewPageViewModel with ChangeNotifier {
  final int placeId;
  final ReviewsService reviewsService;

  WriteReviewPageViewModel({required this.placeId, required this.reviewsService}) {
    init();
  }

  late TextEditingController _textController;
  TextEditingController get textController => _textController;

  bool get isFilled => _rating != 0 && _reviewText.isNotEmpty;

  init() {
    _textController = TextEditingController();
  }

  int _rating = 0;
  int get rating => _rating;

  String _reviewText = '';

  void onReviewTextChange(String value) {
    _reviewText = value;
    notifyListeners();
  }

  void onRatingChange(int value) {
    _rating = value;
    notifyListeners();
  }

  Future<void> onSentReviewButtonPressed() async {
    final response = await reviewsService
        .addReview(AddReviewRequestBody(rating: _rating, reviewText: _reviewText, placeId: placeId));
    response.fold((result) {}, (exception, error) {});
  }
}
