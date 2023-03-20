import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../tabs_page/tabs_page_model.dart';
import 'components/events_page.dart';
import 'components/excursions_page.dart';
import 'components/locations_page.dart';
import 'places_page_model.dart';

class PlacesPage extends StatelessWidget {
  const PlacesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final deviveSize = MediaQuery.of(context).size;
    return ChangeNotifierProvider(
      create: (context) => PlacesPageViewModel(
          eventsService: context.read<InitializeProvider>().eventsService,
          placesService: context.read<InitializeProvider>().placesService,
          excursionsService: context.read<InitializeProvider>().excursionsService),
      child: Builder(builder: (context) {
        final pageIndex = context.select((PlacesPageViewModel model) => model.pageIndex);
        final pageController = context.read<TabsPageViewModel>().placesController;
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              'Места',
              style: theme.textTheme.displayMedium!
                  .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
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
                        onTap: () => pageController!.jumpToPage(0),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Локации',
                            style: theme.textTheme.displayMedium!
                                .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => pageController!.jumpToPage(1),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'Экскурсии',
                            style: theme.textTheme.displayMedium!
                                .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                          ),
                        ),
                      ),
                      InkWell(
                        onTap: () => pageController!.jumpToPage(2),
                        child: Padding(
                          padding: const EdgeInsets.all(10),
                          child: Text(
                            'События',
                            style: theme.textTheme.displayMedium!
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
                      child: AnimatedContainer(
                        duration: const Duration(seconds: 2),
                        curve: Curves.easeInOut,
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
                  controller: context.read<TabsPageViewModel>().placesController,
                  children: const [
                    LocationsPage(),
                    ExcursionsPage(),
                    EventsPage(),
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
