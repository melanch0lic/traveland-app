import 'package:flutter/material.dart';

import '../widgets/search_widget.dart';
import '../widgets/filter_header.dart';
import '../widgets/appbar.dart';
import '../widgets/attraction_listview_house_rent.dart';
import '../dummy_data.dart';

class HousePage extends StatelessWidget {
  final Function? changeIndex;

  const HousePage(this.changeIndex);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            const CustomAppBar(),
            SearchWidget(),
            const FilterHeader('Жильё'),
            AttractionListViewHouse(attractionList1),
          ],
        ),
      ),
    );
  }
}
