import 'package:flutter/material.dart';
import 'package:hackground_app/widgets/appbar.dart';
import 'package:hackground_app/widgets/name_row_header.dart';

import '../widgets/header_widget.dart';
import '../dummy_data.dart';
import '../widgets/attraction_listview.dart';
import '../widgets/appbar.dart';

class LandingPage extends StatelessWidget {
  final Function? changeIndex;

  LandingPage(this.changeIndex);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
            changeSelectedPageIndex: changeIndex,
          ),
          HeaderWidget(),
          NameRowHeader(name: 'Жильё'),
          AttractionListView(attractionList1),
          NameRowHeader(name: 'Места'),
          AttractionListView(attractionList2),
          NameRowHeader(name: 'Мероприятия'),
          AttractionListView(attractionList3),
        ],
      ),
    );
  }
}
