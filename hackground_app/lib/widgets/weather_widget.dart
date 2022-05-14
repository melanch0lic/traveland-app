import 'package:flutter/material.dart';

import '../dummy_data.dart';

class WeatherWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Container(
        margin: const EdgeInsets.all(10),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                blurRadius: 20,
                offset: Offset.zero,
                color: Colors.black.withOpacity(0.1),
              )
            ]),
        child: Container(
          padding: EdgeInsets.all(12),
          child: Column(
            children: [
              Container(
                height: 60,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Image.network(
                          'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_17-512.png',
                          width: 42,
                          height: 42,
                        ),
                        SizedBox(
                          width: 4,
                        ),
                        Padding(
                          padding: const EdgeInsets.only(top: 8),
                          child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text('19°С',
                                    style: TextStyle(
                                      color: Colors.lightBlue,
                                      fontSize: 20,
                                    )),
                                SizedBox(
                                  height: 5,
                                ),
                                Text('30% Влажность',
                                    style: TextStyle(color: Colors.grey))
                              ]),
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 8, right: 8),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.end,
                        children: [
                          Text(
                            'Пятница, 13 Мая',
                            style: TextStyle(
                                fontSize: 14, fontWeight: FontWeight.bold),
                          ),
                          SizedBox(
                            height: 5,
                          ),
                          Text(
                            'Гроза',
                            style: TextStyle(fontSize: 12, color: Colors.grey),
                          )
                        ],
                      ),
                    )
                  ],
                ),
                decoration: BoxDecoration(
                  border: Border(
                    bottom: BorderSide(
                        width: 1, color: Colors.grey.withOpacity(0.5)),
                  ),
                ),
              ),
              Container(
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: List.generate(
                      8,
                      (index) => Container(
                            margin: EdgeInsets.all(8),
                            child: Column(
                              children: [
                                Image.network(
                                  weatherList[index].imgSrc as String,
                                  width: 40,
                                  height: 40,
                                ),
                                SizedBox(
                                  height: 4,
                                ),
                                Text(
                                  weatherList[index].time as String,
                                  style: TextStyle(fontSize: 12),
                                ),
                              ],
                            ),
                          )),
                ),
              ),
            ],
          ),
        ));
  }
}
