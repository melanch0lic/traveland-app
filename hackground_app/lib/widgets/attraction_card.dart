import 'package:flutter/material.dart';

import '../models/attraction_model.dart';

import '../unities.dart';

class AttractionCard extends StatelessWidget {
  final Attraction attraction;

  AttractionCard(this.attraction);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.symmetric(horizontal: 8),
      padding: EdgeInsets.only(left: 4, right: 4, top: 4, bottom: 8),
      width: 130,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(10),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset.zero,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            height: 97,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Stack(children: [
                Container(
                  height: 96,
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: NetworkImage(attraction.imgSrc!),
                      fit: BoxFit.cover,
                    ),
                  ),
                ),
                Positioned(
                  right: 8,
                  bottom: 8,
                  child: Container(
                    width: 32,
                    height: 16,
                    decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(5),
                        gradient: LinearGradient(
                            colors: [
                              Units.attractionGradient1,
                              Units.attractionGradient2,
                            ],
                            begin: Alignment.topLeft,
                            end: Alignment.bottomRight)),
                    child: Row(
                      children: [
                        Icon(
                          Icons.star,
                          color: Colors.white,
                          size: 10,
                        ),
                        SizedBox(
                          width: 2,
                        ),
                        Text(
                          '${attraction.starRating.toString()}',
                          style: TextStyle(color: Colors.white, fontSize: 12),
                        )
                      ],
                    ),
                  ),
                )
              ]),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Container(
            height: 12,
            child: FittedBox(
              child: Text(
                attraction.name!,
                style: TextStyle(fontSize: 12, fontWeight: FontWeight.bold),
              ),
            ),
          ),
          SizedBox(
            height: 4,
          ),
          Row(
            children: [
              Icon(
                Icons.place,
                size: 12,
                color: Colors.red,
              ),
              SizedBox(width: 4),
              Text(
                '${attraction.distance.toString()} ${attraction.distType} • ${attraction.reviewCount} оценок',
                style: TextStyle(fontSize: 9, color: Colors.grey),
              ),
            ],
          ),
          SizedBox(
            height: 4,
          ),
          if (attraction.price != null)
            Text(
              'от ${attraction.price.toString()} руб',
              style: TextStyle(fontSize: 12),
            )
        ],
      ),
    );
  }
}
