import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../widgets/event_small_listview.dart';
import '../../widgets/excursion_small_listview.dart';
import '../../widgets/housing_small_listview.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/location_small_listview.dart';
import '../../widgets/name_row_header_events.dart';
import '../../widgets/name_row_header_excursions.dart';
import '../../widgets/name_row_header_housings.dart';
import '../../widgets/name_row_header_places.dart';
import 'components/socket_error_home_widget.dart';
import 'home_page_model.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => HomePageViewModel(
          cachedDataRepository: context.read<InitializeProvider>().cachedDataRepository,
          eventsService: context.read<InitializeProvider>().eventsService,
          excursionsService: context.read<InitializeProvider>().excursionsService,
          placesService: context.read<InitializeProvider>().placesService,
          housingService: context.read<InitializeProvider>().housingService),
      child: Builder(builder: (context) {
        final isLoading = context.select((HomePageViewModel model) => model.isLoading);
        final excursions = context.select((HomePageViewModel model) => model.excursionList);
        final housings = context.select((HomePageViewModel model) => model.housingList);
        final places = context.select((HomePageViewModel model) => model.placesList);
        final events = context.select((HomePageViewModel model) => model.eventList);
        final isConnected = context.select((HomePageViewModel model) => model.isConnected);
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              'Traveland',
              style: theme.textTheme.displayMedium!
                  .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          body: isLoading
              ? Center(
                  child: SpinKitSpinningLines(color: theme.indicatorColor),
                )
              : isConnected &&
                      excursions!.isNotEmpty &&
                      housings!.isNotEmpty &&
                      places!.isNotEmpty &&
                      events!.isNotEmpty
                  ? SafeArea(
                      child: SingleChildScrollView(
                        padding: const EdgeInsets.only(bottom: 15),
                        child: Column(
                          children: [
                            ImageSlider(urlImages: const [
                              'https://i.pinimg.com/564x/8d/1a/31/8d1a313c3fd96aeddeefe1076630314e.jpg',
                              'https://i.pinimg.com/564x/69/48/4b/69484bd5c1083474056160ffb0909156.jpg',
                              'https://i.pinimg.com/564x/cf/10/50/cf1050ce11decdaa259f5a52ee468453.jpg',
                              'https://i.pinimg.com/564x/ad/ab/fc/adabfc4bc0da19d0d2d075607d5f2a88.jpg',
                              'https://i.pinimg.com/564x/5b/3a/e1/5b3ae1702549260dd72e8d9607c35631.jpg',
                            ]),
                            Column(children: [
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: NameRowHeaderExcursions(
                                  name: 'Экскурсии',
                                ),
                              ),
                              ExcursionSmallListView(excursions: excursions),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: NameRowHeaderHousings(
                                  name: 'Жильё',
                                ),
                              ),
                              HousingSmallListView(housings: housings),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: NameRowHeaderPlaces(
                                  name: 'Места',
                                ),
                              ),
                              LocationSmallListView(places: places),
                              const Padding(
                                padding: EdgeInsets.symmetric(horizontal: 15),
                                child: NameRowHeaderEvents(
                                  name: 'События',
                                ),
                              ),
                              EventSmallListView(events: events),
                            ])
                          ],
                        ),
                      ),
                    )
                  : const SocketErrorHomeWidget(),
        );
      }),
    );
  }
}
