import 'package:flutter/material.dart';

import '../../data/network/models/entity/event_entity.dart';
import '../../data/network/models/entity/review_api_entity.dart';
import '../../domain/repositories/cache_data_repository.dart';
import '../../domain/services/reviews_service.dart';

class DetailsEventPageViewModel with ChangeNotifier {
  final CachedDataRepository cachedDataRepository;
  final ReviewsService reviewsService;
  final int placeId;
  DetailsEventPageViewModel(this.cachedDataRepository, this.reviewsService, this.placeId) {
    init();
  }

  Future<void> init() async {
    await fetchReviewsFromApi();
    notifyListeners();
  }

  List<EventsEntity> get events => cachedDataRepository.eventList!;

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
