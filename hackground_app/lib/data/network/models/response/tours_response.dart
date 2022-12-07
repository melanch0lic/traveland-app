import 'package:json_annotation/json_annotation.dart';

import '../entity/tour_entity.dart';

part 'tours_response.g.dart';

@JsonSerializable()
class ToursResponse {
  @JsonKey(name: 'count')
  final int count;

  @JsonKey(name: 'next')
  final String? next;

  @JsonKey(name: 'previous')
  final String? previous;

  @JsonKey(name: 'results')
  final List<TourEntity> results;

  ToursResponse({required this.count, required this.next, required this.previous, required this.results});

  factory ToursResponse.fromJson(Map<String, dynamic> json) => _$ToursResponseFromJson(json);

  Map<String, dynamic> toJson() => _$ToursResponseToJson(this);
}
