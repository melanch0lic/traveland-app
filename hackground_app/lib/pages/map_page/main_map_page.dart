import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import 'components/gps_button.dart';
import 'components/map_category_select_widget.dart';
import 'components/map_sliding_up_panel.dart';
import 'components/map_widget.dart';
import 'components/search_map_widget.dart';
import 'components/search_opened_widget.dart';
import 'components/zoom_buttons.dart';
import 'map_page_model.dart';

class MainMapPage extends StatelessWidget {
  const MainMapPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapPageViewModel(
          context.read<InitializeProvider>().osrmService, context.read<InitializeProvider>().cachedDataRepository),
      child: Builder(builder: (context) {
        final theme = Theme.of(context);
        final isSearchOpened = context.select((MapPageViewModel model) => model.isSearchOpened);
        final selectedPlace = context.select((MapPageViewModel model) => model.selectedPlace);
        final items = context.select((MapPageViewModel model) => model.items);
        final isRouteCreated = context.select((MapPageViewModel model) => model.isRouteWindowOpened);
        final searchList = context.select((MapPageViewModel model) => model.searchObjects);
        return Scaffold(
          body: Stack(children: [
            const MapWidget(),
            SizedBox(
              child: AnimatedCrossFade(
                firstChild: SafeArea(
                  child: AnimatedCrossFade(
                    firstChild: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: const [
                          SearchMapWidget(),
                          MapCategorySelectWidget(),
                        ],
                      ),
                    ),
                    secondChild: Container(
                      height: MediaQuery.of(context).size.height * 0.9,
                      color: Colors.white,
                      child: Padding(
                        padding: const EdgeInsets.all(15),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            const SearchOpenedWidget(),
                            const SizedBox(height: 30),
                            Text(
                              'Результаты поиска',
                              style: theme.textTheme.bodyText1!
                                  .copyWith(fontSize: 20, fontWeight: FontWeight.w500, color: theme.primaryColorDark),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              child: ListView.separated(
                                separatorBuilder: (context, index) => const Divider(),
                                itemCount: searchList.length,
                                itemBuilder: (context, index) => ListTile(
                                  leading: SizedBox(
                                      width: 32,
                                      height: 32,
                                      child: Image.asset(
                                        'assets/images/location_search.png',
                                      )),
                                  textColor: Colors.black,
                                  title: Text(searchList[index].placeInfo.name),
                                  trailing: const Icon(Icons.call_missed),
                                  onTap: () {},
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ),
                    firstCurve: Curves.easeOut,
                    secondCurve: Curves.easeIn,
                    sizeCurve: Curves.bounceOut,
                    duration: const Duration(milliseconds: 500),
                    crossFadeState: isSearchOpened ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                  ),
                ),
                secondChild: Container(
                  height: MediaQuery.of(context).size.height / 4,
                  decoration: const BoxDecoration(color: Colors.white),
                  child: SafeArea(
                    child: Column(
                      children: [
                        Expanded(
                          child: Row(crossAxisAlignment: CrossAxisAlignment.start, children: [
                            IconButton(
                                onPressed: () {
                                  context.read<MapPageViewModel>().onBackRouteButtonPressed();
                                },
                                icon: SvgPicture.asset('assets/images/back_arrow_icon.svg')),
                            Expanded(
                              child: ReorderableListView(
                                onReorder: (oldIndex, newIndex) =>
                                    context.read<MapPageViewModel>().onReorderHandle(oldIndex, newIndex),
                                children: items
                                    .map((item) => ListTile(
                                          key: UniqueKey(),
                                          title: Text(item),
                                        ))
                                    .toList(),
                              ),
                            )
                          ]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                onPressed: () => context.read<MapPageViewModel>().onSelectDrivingRouteButtonPressed(),
                                child: const Text('car')),
                            const SizedBox(
                              width: 5,
                            ),
                            ElevatedButton(
                                onPressed: () => context.read<MapPageViewModel>().onSelectFootRouteButtonPressed(),
                                child: const Text('foot')),
                          ],
                        )
                      ],
                    ),
                  ),
                ),
                crossFadeState: isRouteCreated ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                duration: const Duration(milliseconds: 500),
              ),
            ),
            if (!isSearchOpened)
              Positioned(
                  right: 10,
                  top: MediaQuery.of(context).size.height / 2 - 100,
                  child: Column(
                    children: const [
                      ZoomButtons(),
                      SizedBox(height: 15),
                      GpsButton(),
                    ],
                  )),
            selectedPlace != null && !isSearchOpened ? const MapSlidingUpPanel() : const SizedBox.shrink(),
          ]),
        );
      }),
    );
  }
}
