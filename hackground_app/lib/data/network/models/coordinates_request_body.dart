import 'package:json_annotation/json_annotation.dart';

part 'coordinates_request_body.g.dart';

@JsonSerializable()
class CoordinatesRequestBody {
  @JsonKey(name: 'coordinates')
  final List<List<double>> coordinates;

  CoordinatesRequestBody({required this.coordinates});

  factory CoordinatesRequestBody.fromJson(Map<String, dynamic> json) => _$CoordinatesRequestBodyFromJson(json);

  Map<String, dynamic> toJson() => _$CoordinatesRequestBodyToJson(this);
}
