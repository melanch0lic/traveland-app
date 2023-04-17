import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../widgets/socket_error_widget.dart';
import '../../widgets/up_scroll_widget.dart';
import 'components/filter_header_hotels.dart';
import 'components/housing_card.dart';
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
        final isConnected = context.select((HousingsPageViewModel model) => model.isConnected);
        final housings = context.select((HousingsPageViewModel model) => model.housings);
        final sortFlag = context.select((HousingsPageViewModel model) => model.sortFlag);
        final isHousingsButtonShow = context.select((HousingsPageViewModel model) => model.isHousingsButtonShow);
        final List<Widget> sortList = [
          ListTile(
            onTap: () => context.read<HousingsPageViewModel>().sortPlacesParametersChange('name', 'asc'),
            title: Text(
              'По названию',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () => context.read<HousingsPageViewModel>().sortPlacesParametersChange('avg_rating', 'asc'),
            title: Text(
              'По рейтингу',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
            ),
          ),
          ListTile(
            onTap: () => context.read<HousingsPageViewModel>().sortPlacesParametersChange('rating_count', 'desc'),
            title: Text(
              'По количеству отзывов',
              style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
            ),
          ),
        ];
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              'Жильё',
              style: theme.textTheme.displayMedium!
                  .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          body: isLoading
              ? Center(
                  child: SpinKitSpinningLines(color: theme.indicatorColor),
                )
              : isConnected && housings.isNotEmpty
                  ? Stack(children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                        child: Column(
                          children: [
                            const FilterHeaderHotels(),
                            const SizedBox(
                              height: 15,
                            ),
                            Expanded(
                              child: Stack(children: [
                                ClipRRect(
                                  borderRadius: BorderRadius.circular(15),
                                  child: ListView.builder(
                                      controller: context.read<HousingsPageViewModel>().housingController,
                                      physics: const BouncingScrollPhysics(),
                                      itemCount: housings.length,
                                      itemBuilder: (context, index) => HousingCard(housings[index])),
                                ),
                                sortFlag
                                    ? Align(
                                        alignment: Alignment.topLeft,
                                        child: Container(
                                          decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(15),
                                              color: Colors.white,
                                              boxShadow: const [
                                                BoxShadow(
                                                  color: Color.fromRGBO(149, 157, 165, 0.25),
                                                  spreadRadius: 5,
                                                  blurRadius: 7,
                                                  offset: Offset(0, 3),
                                                ),
                                              ]),
                                          child: ListView.separated(
                                              physics: const BouncingScrollPhysics(),
                                              shrinkWrap: true,
                                              itemBuilder: (context, index) => sortList[index],
                                              separatorBuilder: (context, index) => const Divider(),
                                              itemCount: sortList.length),
                                        ),
                                      )
                                    : const SizedBox.shrink(),
                              ]),
                            ),
                          ],
                        ),
                      ),
                      if (isHousingsButtonShow)
                        UpScrollWidget(
                          callback: () {
                            context
                                .read<HousingsPageViewModel>()
                                .housingController
                                .animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                          },
                        )
                    ])
                  : SocketErrorWidget(callback: () => context.read<HousingsPageViewModel>().init()),
        );
      }),
    );
  }
}
