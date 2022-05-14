import 'package:flutter/material.dart';

import '../models/attraction_model.dart';

import '../unities.dart';

class AttractionCardHouse extends StatelessWidget {
  final Attraction attraction;

  AttractionCardHouse(this.attraction);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      margin: EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      padding: EdgeInsets.all(4),
      height: 222,
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
            height: 151,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(10),
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(10),
              child: Container(
                height: 151,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: NetworkImage(attraction.imgSrc!),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
          ),
          Container(
            margin: EdgeInsets.only(top: 16, left: 8, right: 8),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Text(
                          attraction.name!,
                          style: TextStyle(
                              fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Container(
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
                                style: TextStyle(
                                    color: Colors.white, fontSize: 12),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                    Text(
                      'от ${attraction.price.toString()} руб',
                      style:
                          TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
                    )
                  ],
                ),
                SizedBox(
                  height: 8,
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
                      '${attraction.address} • ${attraction.reviewCount} оценок',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
