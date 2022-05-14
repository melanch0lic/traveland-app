import 'package:flutter/material.dart';

import '../widgets/weather_widget.dart';
import 'search_widget.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SearchWidget(),
        WeatherWidget(),
      ],
    );
  }
}
