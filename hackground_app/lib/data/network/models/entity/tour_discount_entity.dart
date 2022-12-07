import 'package:json_annotation/json_annotation.dart';

part 'tour_discount_entity.g.dart';

@JsonSerializable()
class TourDiscountEntity {
  @JsonKey(name: 'value')
  final double value;

  @JsonKey(name: 'expiration_date')
  final String expirationDate;

  @JsonKey(name: 'expiration_text')
  final String expirationText;

  @JsonKey(name: 'original_price')
  final double originalPrice;

  TourDiscountEntity(
      {required this.value, required this.expirationDate, required this.expirationText, required this.originalPrice});

  factory TourDiscountEntity.fromJson(Map<String, dynamic> json) => _$TourDiscountEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TourDiscountEntityToJson(this);
}
