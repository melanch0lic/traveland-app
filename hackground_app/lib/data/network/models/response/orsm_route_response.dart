import 'package:json_annotation/json_annotation.dart';

import '../../reflector.dart';
import '../entity/route_entity.dart';

part 'orsm_route_response.g.dart';

@ApiModel()
@JsonSerializable()
class OsrmRouteResponse {
  @JsonKey(name: 'features')
  List<RouteEntity> routes;

  OsrmRouteResponse({required this.routes});

  factory OsrmRouteResponse.fromJson(Map<String, dynamic> json) => _$OsrmRouteResponseFromJson(json);
}
