import 'package:flutter/material.dart';

import '../../data/network/models/entity/tour_entity.dart';
import '../../domain/repositories/cache_data_repository.dart';

class DetailsExursionPageViewModel with ChangeNotifier {
  final CachedDataRepository cachedDataRepository;

  DetailsExursionPageViewModel(this.cachedDataRepository);

  List<TourEntity> get excursions => cachedDataRepository.excursionList!;

  bool _isFullTextShowed = false;
  bool get isFullTextShowed => _isFullTextShowed;

  void onShowFullButtonPressed() {
    _isFullTextShowed = !_isFullTextShowed;
    notifyListeners();
  }
}
