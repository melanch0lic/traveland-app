import 'package:flutter/material.dart';

import '../models/guide_model.dart';

class GuideCard extends StatelessWidget {
  final Guide guide;

  GuideCard(this.guide);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(left: 16, right: 16, bottom: 8, top: 4),
      height: 200,
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(20),
          boxShadow: [
            BoxShadow(
              blurRadius: 10,
              offset: Offset.zero,
              color: Colors.black.withOpacity(0.1),
            )
          ]),
      child: Column(
        children: [
          Container(
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            height: 100,
            decoration: BoxDecoration(
              border: Border(
                bottom:
                    BorderSide(width: 1, color: Colors.grey.withOpacity(0.5)),
              ),
            ),
            child: ListTile(
              leading: CircleAvatar(
                  backgroundImage: NetworkImage(
                      'https://lh3.googleusercontent.com/a-/AAuE7mChgTiAe-N8ibcM3fB_qvGdl2vQ9jvjYv0iOOjB=s96-c'),
                  radius: 80),
              title: Text(
                guide.name!,
                style: TextStyle(color: Colors.blueAccent, fontSize: 16),
              ),
              subtitle: Column(
                children: [
                  Row(
                    children: [
                      Icon(
                        Icons.time_to_leave,
                        color: guide.isCar! ? Colors.green : Colors.red,
                      ),
                      SizedBox(width: 2),
                      guide.isCar!
                          ? Text(
                              'Своя машина',
                              style: TextStyle(
                                  color: Colors.green,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            )
                          : Text(
                              'Нет собственной машины',
                              style: TextStyle(
                                  color: Colors.red,
                                  fontSize: 12,
                                  fontWeight: FontWeight.bold),
                            ),
                      SizedBox(
                        width: 8,
                      ),
                      if (guide.isCar!)
                        Text(
                          guide.carName!,
                          style: TextStyle(
                              color: Colors.grey,
                              fontSize: 12,
                              fontWeight: FontWeight.bold),
                        )
                    ],
                  ),
                  Row(
                    children: [
                      Icon(Icons.star, color: Colors.yellow),
                      Text(
                        '${guide.starRating}',
                        style: TextStyle(
                            color: Colors.grey,
                            fontSize: 12,
                            fontWeight: FontWeight.bold),
                      ),
                      SizedBox(
                        width: 8,
                      ),
                      Text(
                        '${guide.reviewCount} отзывов',
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 12,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
          Container(
            height: 100,
            padding: EdgeInsets.symmetric(vertical: 8, horizontal: 16),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text('АКТУАЛЬНЫХ МАРШРУТОВ ${guide.actualRoutesCount}'),
                    SizedBox(
                      height: 8,
                    ),
                    Text('ПОСЛЕДНИЙ МАРШРУТ ${guide.lastRoute}')
                  ],
                ),
                Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    TextButton(
                        onPressed: () {},
                        child: Text(
                          'Подробнее',
                          style: TextStyle(color: Colors.lightBlue),
                        ))
                  ],
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
