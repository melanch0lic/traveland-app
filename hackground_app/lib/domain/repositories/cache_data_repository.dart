import '../../data/network/models/entity/event_entity.dart';
import '../../data/network/models/entity/housing_entity.dart';
import '../../data/network/models/entity/place_entity.dart';
import '../../data/network/models/entity/review_entity.dart';
import '../../data/network/models/entity/tour_entity.dart';

class CachedDataRepository {
  List<EventsEntity>? eventList;
  List<PlaceEntity>? placesList;
  List<TourEntity>? excursionList;
  List<HousingEntity>? housingList;
  List<ReviewEntity>? reviewsList;

  void clear() {
    if (eventList != null) {
      eventList!.clear();
    }
    if (placesList != null) {
      placesList!.clear();
    }
    if (excursionList != null) {
      excursionList!.clear();
    }
    if (housingList != null) {
      housingList!.clear();
    }
    if (reviewsList != null) {
      reviewsList!.clear();
    }
  }
}
