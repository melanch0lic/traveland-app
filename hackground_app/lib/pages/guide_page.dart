import 'package:flutter/material.dart';

import '../unities.dart';
import '../widgets/filter_header.dart';
import '../widgets/appbar.dart';
import '../widgets/search_widget.dart';
import '../widgets/guide_listview.dart';

class GuidePage extends StatelessWidget {
  final Function? changeIndex;

  GuidePage(this.changeIndex);
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
          FilterHeader('Гиды'),
          GuideListView(),
        ],
      ),
    );
  }
}
