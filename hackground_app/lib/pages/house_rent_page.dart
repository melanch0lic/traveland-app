import 'package:flutter/material.dart';

import '../unities.dart';
import '../widgets/search_widget.dart';
import '../widgets/filter_header.dart';
import '../widgets/appbar.dart';
import '../widgets/attraction_listview_house_rent.dart';
import '../dummy_data.dart';

class HousePage extends StatelessWidget {
  final Function? changeIndex;

  HousePage(this.changeIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          CustomAppBar(
            changeSelectedPageIndex: changeIndex,
          ),
          SearchWidget(),
          FilterHeader('Жильё'),
          AttractionListViewHouse(attractionList1),
        ],
      ),
    );
  }
}
