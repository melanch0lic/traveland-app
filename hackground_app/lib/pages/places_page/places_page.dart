import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../dummy_data.dart';
import '../hotels_page/components/attraction_listview_house_rent.dart';
import 'components/filter_header_events.dart';
import 'components/filter_header_excursions.dart';
import 'components/filter_header_locations.dart';
import 'places_page_model.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviveSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => PlacesPageViewModel(),
      child: Builder(builder: (context) {
        final pageIndex = context.select((PlacesPageViewModel model) => model.pageIndex);
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              'Места',
              style:
                  theme.textTheme.headline2!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
            backgroundColor: theme.primaryColorLight,
            elevation: 0,
          ),
          body: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                color: theme.primaryColorLight,
                height: 50,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Row(mainAxisAlignment: MainAxisAlignment.spaceAround, children: [
                      InkWell(
                        onTap: () => context.read<PlacesPageViewModel>().controller!.jumpToPage(0),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Локации',
                            style: theme.textTheme.headline2!
                                .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => context.read<PlacesPageViewModel>().controller!.jumpToPage(1),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Экскурсии',
                            style: theme.textTheme.headline2!
                                .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => context.read<PlacesPageViewModel>().controller!.jumpToPage(2),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'События',
                            style: theme.textTheme.headline2!
                                .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      )
                    ]),
                    Align(
                      alignment: pageIndex == 0
                          ? Alignment.centerLeft
                          : pageIndex == 1
                              ? Alignment.center
                              : Alignment.centerRight,
                      child: Container(
                        width: deviveSize.width / 3,
                        decoration: BoxDecoration(color: theme.cardColor, borderRadius: BorderRadius.circular(15)),
                        height: 5,
                      ),
                    )
                  ],
                ),
              ),
              Expanded(
                child: PageView(
                  controller: context.read<PlacesPageViewModel>().controller,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: Column(
                        children: [
                          const FilterHeaderLocations(),
                          const SizedBox(
                            height: 15,
                          ),
                          AttractionListViewHouse(attractionListHouse),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: Column(
                        children: [
                          const FilterHeaderExcursions(),
                          const SizedBox(
                            height: 15,
                          ),
                          AttractionListViewHouse(attractionListHouse),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: Column(
                        children: [
                          const FilterHeaderEvents(),
                          const SizedBox(
                            height: 15,
                          ),
                          AttractionListViewHouse(attractionListHouse),
                        ],
                      ),
                    ),
                  ],
                  onPageChanged: (page) {
                    context.read<PlacesPageViewModel>().onPageChanged(page);
                  },
                ),
              )
              // )
            ],
          ),
        );
      }),
    );
  }
}
