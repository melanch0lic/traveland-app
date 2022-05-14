import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';
import '../dummy_data.dart';
import '../widgets/attraction_listview.dart';
import '../widgets/appbar.dart';
import '../widgets/name_row_header.dart';

class LandingPage extends StatelessWidget {
  final Function? changeIndex;

  const LandingPage(this.changeIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              CustomAppBar(
                changeSelectedPageIndex: changeIndex,
              ),
              const HeaderWidget(),
              NameRowHeader(name: 'Жильё'),
              AttractionListView(attractionList1),
              NameRowHeader(name: 'Места'),
              AttractionListView(attractionList2),
              NameRowHeader(name: 'Мероприятия'),
              AttractionListView(attractionList3),
            ],
          ),
        ),
      ),
    );
  }
}
