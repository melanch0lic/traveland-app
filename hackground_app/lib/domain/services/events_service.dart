import '../../data/network/main_api_client.dart';
import '../../data/network/models/response/events_response.dart';
import '../../data/network/result.dart';

class EventsService {
  final MainApiClient mainApiClient;

  EventsService({required this.mainApiClient});

  Future<Result<EventsResponse>> getEvents(String sortBy, String sortOrder, int placeTypeId) async {
    final response = await mainApiClient.getEvents(sortBy, sortOrder, placeTypeId);
    return response;
  }
}
