import 'package:flutter/cupertino.dart';

import '../../data/network/models/entity/tour_entity.dart';
import '../../domain/repositories/cache_data_repository.dart';
import '../../domain/services/events_service.dart';
import '../../domain/services/excursions_service.dart';

class HomePageViewModel with ChangeNotifier {
  final EventsService eventsService;
  final ExcursionsService excursionsService;
  final CachedDataRepository cachedDataRepository;

  List<TourEntity>? get excursionList => cachedDataRepository.excursionList;

  bool _isLoading = false;
  bool get isLoading => _isLoading;

  HomePageViewModel(
      {required this.cachedDataRepository,
      required this.eventsService,
      required this.excursionsService}) {
    init();
  }

  Future<void> init() async {
    _isLoading = true;
    notifyListeners();

    await fetchExcursionsData();

    _isLoading = false;
    notifyListeners();
  }

  Future<void> fetchExcursionsData() async {
    final response = await excursionsService.getTours(1);
    response.fold((result) {
      cachedDataRepository.excursionList = result.results;
    }, (exception, error) {});
  }
}
