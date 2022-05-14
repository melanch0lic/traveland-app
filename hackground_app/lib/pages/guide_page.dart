import 'package:flutter/material.dart';

import '../unities.dart';
import '../widgets/filter_header.dart';
import '../widgets/search_widget.dart';

class GuidePage extends StatelessWidget {
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
          FilterHeader('Гиды'),
        ],
      ),
    );
  }
}
