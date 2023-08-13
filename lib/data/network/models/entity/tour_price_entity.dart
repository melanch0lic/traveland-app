import 'package:json_annotation/json_annotation.dart';

import 'tour_discount_entity.dart';

part 'tour_price_entity.g.dart';

@JsonSerializable()
class TourPriceEntity {
  @JsonKey(name: 'value')
  final double value;

  @JsonKey(name: 'currency')
  final String currency;

  @JsonKey(name: 'currency_rate')
  final double? currencyRate;

  @JsonKey(name: 'price_from')
  final bool priceFrom;

  @JsonKey(name: 'unit_string')
  final String unitString;

  @JsonKey(name: 'value_string')
  final String valueString;

  @JsonKey(name: 'discount')
  final TourDiscountEntity? discount;

  TourPriceEntity(
      {required this.value,
      required this.currency,
      required this.currencyRate,
      required this.priceFrom,
      required this.unitString,
      required this.valueString,
      required this.discount});

  factory TourPriceEntity.fromJson(Map<String, dynamic> json) => _$TourPriceEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TourPriceEntityToJson(this);
}
