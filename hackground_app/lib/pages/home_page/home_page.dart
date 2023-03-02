import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../widgets/event_small_listview.dart';
import '../../widgets/excursion_small_listview.dart';
import '../../widgets/housing_small_listview.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/location_small_listview.dart';
import '../../widgets/name_row_header_events.dart';
import '../../widgets/name_row_header_excursions.dart';
import '../../widgets/name_row_header_housing.dart';
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
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : isConnected
                  ? SafeArea(
                      child: SingleChildScrollView(
                        child: Column(
                          children: [
                            ImageSlider(urlImages: const [
                              'https://i.pinimg.com/564x/72/e5/07/72e507286f50612814fa92f054fa1e1e.jpg',
                              'https://i.pinimg.com/564x/94/99/0a/94990a71c729fbe8416c7ab6084ea408.jpg',
                              'https://i.pinimg.com/564x/cf/10/50/cf1050ce11decdaa259f5a52ee468453.jpg',
                              'https://i.pinimg.com/564x/2f/00/7f/2f007fe235ee16822f48b00a9585bb86.jpg',
                              'https://i.pinimg.com/564x/5b/3a/e1/5b3ae1702549260dd72e8d9607c35631.jpg',
                            ]),
                            Padding(
                              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 10),
                              child: Column(children: [
                                const NameRowHeaderExcursions(
                                  name: 'Экскурсии',
                                ),
                                ExcursionSmallListView(excursions: excursions!),
                                const NameRowHeaderHousing(
                                  name: 'Жильё',
                                ),
                                HousingSmallListView(housings: housings!),
                                const NameRowHeaderPlaces(
                                  name: 'Места',
                                ),
                                LocationSmallListView(places: places!),
                                const NameRowHeaderEvents(
                                  name: 'События',
                                ),
                                EventSmallListView(events: events!),
                              ]),
                            )
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
