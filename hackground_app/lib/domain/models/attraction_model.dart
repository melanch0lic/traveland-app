class Attraction {
  final String? imgSrc;
  final String? name;
  final double? starRating;
  final double? distance;
  final int? reviewCount;
  final int? price;
  final String? distType;
  final String? address;
  final String? date;
  final String? clock;

  Attraction(
      {this.address,
      this.imgSrc,
      this.name,
      this.starRating,
      this.distance,
      this.reviewCount,
      this.price,
      this.distType,
      this.date,
      this.clock});
}
