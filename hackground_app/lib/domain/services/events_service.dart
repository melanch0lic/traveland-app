import '../../data/network/main_api_client.dart';
import '../../data/network/models/response/events_response.dart';
import '../../data/network/result.dart';

class EventsService {
  final MainApiClient mainApiClient;

  EventsService({required this.mainApiClient});

  Future<Result<EventsResponse>> getEvents() async {
    final response = await mainApiClient.getEvents();
    return response;
  }
}
