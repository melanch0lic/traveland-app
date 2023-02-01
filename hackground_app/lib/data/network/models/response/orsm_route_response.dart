import 'package:json_annotation/json_annotation.dart';

import '../../reflector.dart';
import '../entity/route_entity.dart';

part 'orsm_route_response.g.dart';

@ApiModel()
@JsonSerializable()
class OrsmRouteResponse {
  @JsonKey(name: 'code')
  String networkCode;

  @JsonKey(name: 'routes')
  List<RouteEntity> routes;

  OrsmRouteResponse({required this.networkCode, required this.routes});

  factory OrsmRouteResponse.fromJson(Map<String, dynamic> json) => _$OrsmRouteResponseFromJson(json);
}
