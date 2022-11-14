import 'package:flutter/material.dart';

import '../../widgets/search_widget.dart';
import '../../widgets/filter_header.dart';
import '../../widgets/appbar.dart';
import 'components/attraction_listview_house_rent.dart';
import '../../dummy_data.dart';

class HousePage extends StatelessWidget {
  const HousePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            const CustomAppBar(),
            const SearchWidget(),
            const FilterHeader('Жильё'),
            AttractionListViewHouse(attractionList1),
          ],
        ),
      ),
    );
  }
}
