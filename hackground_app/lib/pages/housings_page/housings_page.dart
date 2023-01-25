import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../dummy_data.dart';
import 'components/filter_header_hotels.dart';
import 'components/housings_listview.dart';
import 'housings_page_model.dart';

class HousingsPage extends StatelessWidget {
  const HousingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => HousingsPageViewModel(context.read<InitializeProvider>().housingService),
      child: Builder(builder: (context) {
        final isLoading = context.select((HousingsPageViewModel model) => model.isLoading);
        final housings = context.select((HousingsPageViewModel model) => model.housings);
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              'Жильё',
              style:
                  theme.textTheme.headline2!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                    child: Column(
                      children: [
                        const FilterHeaderHotels(),
                        const SizedBox(
                          height: 15,
                        ),
                        HousingsListView(housings),
                      ],
                    ),
                  ),
                ),
        );
      }),
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

