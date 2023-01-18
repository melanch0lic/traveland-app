import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../dummy_data.dart';

import '../../widgets/image_slider.dart';
import '../../widgets/name_row_header.dart';
import 'components/attraction_listview.dart';
import '../../widgets/excursion_small_listview.dart';
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
          excursionsService: context.read<InitializeProvider>().excursionsService),
      child: Builder(builder: (context) {
        final isLoading = context.select((HomePageViewModel model) => model.isLoading);
        final excursions = context.select((HomePageViewModel model) => model.excursionList);
        return Scaffold(
          backgroundColor: theme.scaffoldBackgroundColor,
          appBar: AppBar(
            title: Text(
              'Traveland',
              style:
                  theme.textTheme.headline2!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
            ),
          ),
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
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
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          child: Column(children: [
                            const NameRowHeader(
                              name: 'Жильё',
                            ),
                            AttractionListView(attractionListHouse),
                            const NameRowHeader(
                              name: 'Места',
                            ),
                            AttractionListView(attractionListPlace),
                            const NameRowHeader(
                              name: 'События',
                            ),
                            AttractionListView(attractionListEvents),
                            const NameRowHeader(
                              name: 'Экскурсии',
                            ),
                            ExcursionSmallListView(excursions: excursions!),
                            const SizedBox(height: 10),
                          ]),
                        )
                      ],
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
