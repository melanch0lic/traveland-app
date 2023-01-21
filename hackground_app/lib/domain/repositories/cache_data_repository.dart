import '../../data/network/models/entity/housing_entity.dart';
import '../../data/network/models/entity/tour_entity.dart';

class CachedDataRepository {
  List<TourEntity>? excursionList;
  List<HousingEntity>? housingList;

  void clear() {}
}
