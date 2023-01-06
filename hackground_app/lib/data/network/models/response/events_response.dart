import 'package:json_annotation/json_annotation.dart';

import '../../api_error.dart';
import '../../reflector.dart';
import '../entity/events_list_entity.dart';

part 'events_response.g.dart';

@ApiModel()
@JsonSerializable()
class EventsResponse {
  @JsonKey(name: 'result')
  EventsListEntity result;
  ApiError error;

  EventsResponse({required this.result, required this.error});

  factory EventsResponse.fromJson(Map<String, dynamic> json) => _$EventsResponseFromJson(json);
}
