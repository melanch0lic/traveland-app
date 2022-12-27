import 'dart:io';

import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

import '../../dummy_data.dart';
import '../../widgets/appbar.dart';
import '../../widgets/filter_header.dart';
import '../../widgets/search_widget.dart';
import '../home_page/components/attraction_listview.dart';
import 'components/attraction_listview_house_rent.dart';

class HotelsPage extends StatefulWidget {
  const HotelsPage({Key? key}) : super(key: key);

  @override
  State<HotelsPage> createState() => _HotelsPageState();
}

class _HotelsPageState extends State<HotelsPage> {
  late WebViewController? _webController;

  @override
  void initState() {
    if (Platform.isAndroid) WebView.platform = AndroidWebView();
    super.initState();
  }

  @override
  void dispose() {
    _webController = null;
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            // const CustomAppBar(),
            // const SearchWidget(),
            //const FilterHeader('Жильё'),
            AttractionListViewHouse(attractionListHouse),
          ],
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

