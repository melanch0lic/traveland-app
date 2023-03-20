import 'package:flutter/material.dart';

import '../../data/network/models/entity/review_entity.dart';
import '../../domain/services/excursions_service.dart';

class ReviewPageViewModel with ChangeNotifier {
  final ExcursionsService excursionsService;
  final int excursionId;

  int _reviewsOffset = 1;
  bool _reviewsHasNextPage = true;

  late ScrollController _reviewController;
  ScrollController get reviewController => _reviewController;

  bool _isFirstLoading = false;
  bool get isFirstLoading => _isFirstLoading;

  bool _isReviewsLoadingMore = false;
  bool get isReviewsLoadingMore => _isReviewsLoadingMore;

  final List<ReviewEntity> _reviews = [];
  List<ReviewEntity> get reviews => _reviews;

  ReviewPageViewModel(this.excursionsService, this.excursionId) {
    _reviewController = ScrollController();
    init();
  }

  Future<void> init() async {
    _reviewController.addListener(() async {
      if (_reviewController.position.extentAfter < 200 && _isReviewsLoadingMore == false && _reviewsHasNextPage) {
        _isReviewsLoadingMore = true;
        notifyListeners();

        await fetchReviewsData();
        _isReviewsLoadingMore = false;
        notifyListeners();
      }
    });

    _isFirstLoading = true;
    notifyListeners();

    await fetchReviewsData();

    _isFirstLoading = false;
    notifyListeners();
  }

  Future<void> fetchReviewsData() async {
    final response = await excursionsService.getTripsterReviews(excursionId, _reviewsOffset);
    response.fold((result) {
      _reviewsHasNextPage = result.next == null ? false : true;
      _reviews.addAll(result.results);
      _reviewsOffset++;
    }, (exception, error) {});
  }
}
