import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dummy_data.dart';
import 'components/attraction_listview_house_rent.dart';
import 'components/filter_header_hotels.dart';
import 'hotels_page_model.dart';

class HotelsPage extends StatelessWidget {
  const HotelsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => HotelsPageViewModel(),
      child: Scaffold(
        backgroundColor: theme.scaffoldBackgroundColor,
        appBar: AppBar(
          title: Text(
            'Жильё',
            style: theme.textTheme.headline2!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          backgroundColor: theme.primaryColorLight,
        ),
        body: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Column(
              children: [
                const FilterHeaderHotels(),
                const SizedBox(
                  height: 15,
                ),
                AttractionListViewHouse(attractionListHouse),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

// body: SafeArea(
      //  child: WebView(
       //   javascriptMode: JavascriptMode.unrestricted,
       //   initialUrl: 'https://sutochno.tp.st/EYdXrV3r',
//onProgress: (progress) {
       //     print('WebView is loading (progress : $progress%)');
       //   },
//gestureNavigationEnabled: true,
      //   backgroundColor: const Color(0x00000000),

