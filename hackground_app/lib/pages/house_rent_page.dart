import 'package:flutter/material.dart';

import '../unities.dart';
import '../widgets/search_widget.dart';
import '../widgets/filter_header.dart';
import '../widgets/attraction_listview_house_rent.dart';
import '../dummy_data.dart';

class HousePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Units.primaryGray,
        iconTheme: IconThemeData(color: Units.mainYellow),
        title: Center(
          child: Icon(Icons.landscape, color: Units.mainYellow),
        ),
        actions: [
          Container(
            margin: EdgeInsets.only(right: 10),
            child: IconButton(
              icon: Icon(Icons.notifications, color: Colors.grey),
              onPressed: () {},
            ),
          )
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        children: [
          SearchWidget(),
          FilterHeader('Жильё'),
          AttractionListViewHouse(attractionList1),
        ],
      ),
    );
  }
}
