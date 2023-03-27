import 'package:flutter/material.dart';

import '../../data/network/models/entity/place_entity.dart';
import '../../data/network/models/entity/review_api_entity.dart';
import '../../domain/repositories/cache_data_repository.dart';
import '../../domain/services/reviews_service.dart';

class DetailsLocationPageViewModel with ChangeNotifier {
  final CachedDataRepository cachedDataRepository;
  final ReviewsService reviewsService;
  final int placeId;
  DetailsLocationPageViewModel(this.cachedDataRepository, this.reviewsService, this.placeId) {
    init();
  }

  Future<void> init() async {
    await fetchReviewsFromApi();
    notifyListeners();
  }

  bool _isSheduleOpened = false;
  bool get isSheduleOpened => _isSheduleOpened;

  void onShedulePressed() {
    _isSheduleOpened = !_isSheduleOpened;
    notifyListeners();
  }

  List<PlaceEntity> get places => cachedDataRepository.placesList!;

  List<ReviewApiEntity> _reviews = [];
  List<ReviewApiEntity> get reviews => _reviews;

  Future<void> fetchReviewsFromApi() async {
    final response = await reviewsService.getReviews(placeId);
    response.fold((result) {
      _reviews = result.result.reviews;
      notifyListeners();
    }, (exception, error) {});
  }
}
