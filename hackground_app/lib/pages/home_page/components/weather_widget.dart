import 'package:flutter/material.dart';

import '../../../dummy_data.dart';

class WeatherWidget extends StatelessWidget {
  const WeatherWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(12),
      decoration: BoxDecoration(color: Colors.white, borderRadius: BorderRadius.circular(20), boxShadow: [
        BoxShadow(
          blurRadius: 20,
          color: Colors.black.withOpacity(0.1),
        )
      ]),
      child: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(8),
            height: 60,
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Image.network(
                  'https://cdn4.iconfinder.com/data/icons/the-weather-is-nice-today/64/weather_17-512.png',
                  width: 42,
                  height: 42,
                ),
                const SizedBox(width: 4),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Text('19°С',
                        style: TextStyle(
                          color: Colors.lightBlue,
                          fontSize: 20,
                        )),
                    SizedBox(height: 5),
                    Expanded(child: Text('30% Влажность', style: TextStyle(color: Colors.grey)))
                  ],
                ),
                const Spacer(),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Text(
                      'Пятница, 13 Мая',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                    SizedBox(height: 5),
                    Text(
                      'Гроза',
                      style: TextStyle(fontSize: 12, color: Colors.grey),
                    )
                  ],
                )
              ],
            ),
          ),
          const Divider(),
          SizedBox(
            height: 75,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemCount: 8,
              itemBuilder: (ctx, index) {
                return Padding(
                  padding: const EdgeInsets.all(8),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Image.network(
                        weatherList[index].imgSrc as String,
                        width: 40,
                        height: 40,
                      ),
                      Text(
                        weatherList[index].time!,
                        style: const TextStyle(fontSize: 12),
                      ),
                    ],
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
