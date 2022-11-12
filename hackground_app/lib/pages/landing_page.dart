import 'package:flutter/material.dart';

import '../widgets/header_widget.dart';
import '../dummy_data.dart';
import '../widgets/attraction_listview.dart';
import '../widgets/appbar.dart';
import '../widgets/name_row_header.dart';

class LandingPage extends StatelessWidget {
  final Function? changeIndex;

  const LandingPage(this.changeIndex, {Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              CustomAppBar(changeSelectedPageIndex: changeIndex),
              const HeaderWidget(),
              NameRowHeader(
                name: 'Жильё',
                changeSelectedPageIndex: changeIndex,
                index: 1,
              ),
              AttractionListView(attractionList1),
              NameRowHeader(
                name: 'Места',
                changeSelectedPageIndex: changeIndex,
                index: 1,
              ),
              AttractionListView(attractionList2),
              NameRowHeader(
                name: 'Мероприятия',
                changeSelectedPageIndex: changeIndex,
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
