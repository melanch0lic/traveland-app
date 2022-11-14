import 'package:flutter/material.dart';

import '../../widgets/filter_header.dart';
import '../../widgets/appbar.dart';
import '../../widgets/search_widget.dart';
import 'components/guide_listview.dart';

class GuidePage extends StatelessWidget {
  const GuidePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: const [
            CustomAppBar(),
            SearchWidget(),
            FilterHeader('Гиды'),
            GuideListView(),
          ],
        ),
      ),
    );
  }
}
