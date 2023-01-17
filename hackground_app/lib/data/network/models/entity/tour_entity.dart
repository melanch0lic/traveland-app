import 'package:json_annotation/json_annotation.dart';

import 'guide_entity.dart';
import 'tour_meeting_point_entity.dart';
import 'tour_price_entity.dart';
import 'tour_shedule_entity.dart';
import 'tripster_photo_entity.dart';

part 'tour_entity.g.dart';

@JsonSerializable()
class TourEntity {
  @JsonKey(name: 'id')
  final int id;

  @JsonKey(name: 'title')
  final String title;

  @JsonKey(name: 'url')
  final String url;

  @JsonKey(name: 'annotation')
  final String annotation;

  @JsonKey(name: 'type')
  final String type;

  @JsonKey(name: 'instant_booking')
  final bool instantBooking;

  @JsonKey(name: 'child_friendly')
  final bool childFriendly;

  @JsonKey(name: 'max_persons')
  final int maxPersons;

  @JsonKey(name: 'duration')
  final double duration;

  @JsonKey(name: 'movement_type')
  final String movementType;

  @JsonKey(name: 'meeting_point')
  final TourMeetingPointEntity? meetingPoint;

  @JsonKey(name: 'price')
  final TourPriceEntity price;

  @JsonKey(name: 'review_count')
  final int reviewCount;

  @JsonKey(name: 'rating')
  final double rating;

  @JsonKey(name: 'popularity')
  final int popularity;

  @JsonKey(name: 'schedule')
  final TourSheduleEntity? schedule;

  @JsonKey(name: 'cover_image')
  final String coverImage;

  @JsonKey(name: 'guide')
  final GuideEntity guide;

  @JsonKey(name: 'photos')
  final List<TripsterPhotoEntity> photos;

  TourEntity(
      {required this.id,
      required this.title,
      required this.url,
      required this.annotation,
      required this.type,
      required this.instantBooking,
      required this.childFriendly,
      required this.maxPersons,
      required this.duration,
      required this.movementType,
      required this.meetingPoint,
      required this.price,
      required this.reviewCount,
      required this.rating,
      required this.popularity,
      required this.schedule,
      required this.coverImage,
      required this.guide,
      required this.photos});

  factory TourEntity.fromJson(Map<String, dynamic> json) => _$TourEntityFromJson(json);

  Map<String, dynamic> toJson() => _$TourEntityToJson(this);
}
