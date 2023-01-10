import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../dummy_data.dart';

import '../../widgets/name_row_header.dart';
import 'components/attraction_listview.dart';
import 'components/weather_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      backgroundColor: theme.scaffoldBackgroundColor,
      appBar: AppBar(
        title: Text(
          'Traveland',
          style: theme.textTheme.headline2!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, bottom: 15),
                  child: Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/marker_filled.svg',
                        color: theme.primaryColorDark,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Владикавказ',
                        style: theme.textTheme.headline2!
                            .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                      )
                    ],
                  ),
                ),
                const WeatherWidget(),
                const NameRowHeader(
                  name: 'Жильё',
                ),
                AttractionListView(attractionListHouse),
                const NameRowHeader(
                  name: 'Места',
                ),
                AttractionListView(attractionListPlace),
                const NameRowHeader(
                  name: 'Мероприятия',
                ),
                AttractionListView(attractionListEvents),
                const SizedBox(height: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
