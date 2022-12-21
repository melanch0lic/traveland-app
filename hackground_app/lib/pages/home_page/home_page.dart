import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import '../../widgets/appbar.dart';
import '../../widgets/header_widget.dart';

import '../../widgets/name_row_header.dart';
import 'components/attraction_listview.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              const CustomAppBar(),
              const HeaderWidget(),
              const NameRowHeader(
                name: 'Жильё',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: AttractionListView(attractionListHouse),
              ),
              const NameRowHeader(
                name: 'Места',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: AttractionListView(attractionListPlace),
              ),
              const NameRowHeader(
                name: 'Мероприятия',
              ),
              Padding(
                padding: const EdgeInsets.only(left: 15),
                child: AttractionListView(attractionListEvents),
              ),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}
