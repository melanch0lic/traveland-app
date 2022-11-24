import 'package:flutter/material.dart';

import '../../widgets/header_widget.dart';
import '../../dummy_data.dart';
import '../../widgets/attraction_listview.dart';
import '../../widgets/appbar.dart';
import '../../widgets/name_row_header.dart';

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
                index: 1,
              ),
              AttractionListView(attractionList1),
              const NameRowHeader(
                name: 'Места',
                index: 1,
              ),
              AttractionListView(attractionList2),
              const NameRowHeader(
                name: 'Мероприятия',
                index: 1,
              ),
              AttractionListView(attractionList3),
              const SizedBox(height: 10),
            ],
          ),
        ),
      ),
    );
  }
}