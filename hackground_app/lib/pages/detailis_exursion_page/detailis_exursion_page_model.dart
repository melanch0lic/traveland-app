import 'package:flutter/material.dart';

import '../../data/network/models/entity/review_entity.dart';
import '../../data/network/models/entity/tour_entity.dart';
import '../../domain/repositories/cache_data_repository.dart';
import '../../domain/services/excursions_service.dart';

class DetailsExursionPageViewModel with ChangeNotifier {
  final ExcursionsService excursionsService;
  final CachedDataRepository cachedDataRepository;
  final int excursionId;

  DetailsExursionPageViewModel(this.cachedDataRepository, this.excursionsService, this.excursionId) {
    init();
  }

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await fetchReviewsData();

    _isLoading = false;
    notifyListeners();
  }

  List<TourEntity> get excursions => cachedDataRepository.excursionList!;

  List<ReviewEntity> get reviews => cachedDataRepository.reviewsList!;

  bool _isLoading = true;
  bool get isLoading => _isLoading;

  bool _isFullTextShowed = false;
  bool get isFullTextShowed => _isFullTextShowed;

  Future<void> fetchReviewsData() async {
    final response = await excursionsService.getTripsterReviews(excursionId, 1);
    response.fold((result) {
      cachedDataRepository.reviewsList = result.results;
    }, (exception, error) {});
  }

  void onShowFullButtonPressed() {
    _isFullTextShowed = !_isFullTextShowed;
    notifyListeners();
  }
}
