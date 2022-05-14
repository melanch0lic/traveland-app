import 'package:flutter/material.dart';
import 'package:hackground_app/widgets/name_row_header.dart';

import '../unities.dart';
import '../widgets/header_widget.dart';
import '../dummy_data.dart';
import '../widgets/attraction_listview.dart';

class LandingPage extends StatelessWidget {
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
