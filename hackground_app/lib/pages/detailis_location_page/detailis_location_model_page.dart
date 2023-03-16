import 'package:flutter/material.dart';

import '../../data/network/models/entity/place_entity.dart';
import '../../domain/repositories/cache_data_repository.dart';
import '../../domain/services/places_service.dart';

class DetailsLocationPageViewModel with ChangeNotifier {
  final CachedDataRepository cachedDataRepository;
  final PlacesService placesService;
  final int placeId;
  DetailsLocationPageViewModel(this.cachedDataRepository, this.placesService, this.placeId);

  List<PlaceEntity> get places => cachedDataRepository.placesList!;
}
