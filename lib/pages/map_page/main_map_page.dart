import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';
import 'package:sliding_up_panel/sliding_up_panel.dart';

import '../../app_initialization.dart';
import '../../widgets/contact_email_widget.dart';
import '../../widgets/contact_phone_widget.dart';
import '../../widgets/contact_website_widget.dart';
import '../../widgets/reviews_rating_widget.dart';
import 'components/map_widget.dart';
import 'components/search_map_widget.dart';
import 'components/search_opened_widget.dart';
import 'components/zoom_buttons.dart';
import 'map_page_model.dart';

String formatMinutes(int minutes) {
  if (minutes % 10 == 1 && minutes % 100 != 11) {
    return '$minutes минута';
  } else if ([2, 3, 4].contains(minutes % 10) && ![12, 13, 14].contains(minutes % 100)) {
    return '$minutes минуты';
  } else {
    return '$minutes минут';
  }
}

class MainMapPage extends StatefulWidget {
  const MainMapPage({Key? key}) : super(key: key);

  @override
  State<MainMapPage> createState() => _MainMapPageState();
}

class _MainMapPageState extends State<MainMapPage> with TickerProviderStateMixin {
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => MapPageViewModel(
          context.read<InitializeProvider>().osrmService, context.read<InitializeProvider>().cachedDataRepository),
      child: Builder(builder: (context) {
        final theme = Theme.of(context);
        final isSearchOpened = context.select((MapPageViewModel model) => model.isSearchOpened);
        final selectedPlace = context.select((MapPageViewModel model) => model.selectedPlace);
        final selectedPosition = context.select((MapPageViewModel model) => model.selectedPosition);
        final isRouteCreated = context.select((MapPageViewModel model) => model.isRouteWindowOpened);
        final searchList = context.select((MapPageViewModel model) => model.searchObjects);
        final mapController = context.read<MapPageViewModel>().mapController;
        final selectedRouteType = context.select((MapPageViewModel model) => model.selectedRouteType);
        final routeDuration = context.select((MapPageViewModel model) => model.routeDuration);

        void _animatedMapMove(LatLng destLocation, double destZoom) {
          // Create some tweens. These serve to split up the transition from one location to another.
          // In our case, we want to split the transition be<tween> our current map center and the destination.
          final latTween = Tween<double>(begin: mapController.center.latitude, end: destLocation.latitude);
          final lngTween = Tween<double>(begin: mapController.center.longitude, end: destLocation.longitude);
          final zoomTween = Tween<double>(begin: mapController.zoom, end: destZoom);

          // Create a animation controller that has a duration and a TickerProvider.
          final controller = AnimationController(duration: const Duration(milliseconds: 1000), vsync: this);
          // The animation determines what path the animation will take. You can try different Curves values, although I found
          // fastOutSlowIn to be my favorite.
          final Animation<double> animation = CurvedAnimation(parent: controller, curve: Curves.fastOutSlowIn);

          controller.addListener(() {
            mapController.move(
                LatLng(latTween.evaluate(animation), lngTween.evaluate(animation)), zoomTween.evaluate(animation));
          });

          animation.addStatusListener((status) {
            if (status == AnimationStatus.completed) {
              controller.dispose();
            } else if (status == AnimationStatus.dismissed) {
              controller.dispose();
            }
          });

          controller.forward();
        }

        return Scaffold(
          body: Stack(children: [
            const MapWidget(),
            SizedBox(
              child: AnimatedCrossFade(
                firstChild: SafeArea(
                  child: AnimatedCrossFade(
                    firstChild: Column(
                      children: [
                        const Padding(
                          padding: EdgeInsets.all(15),
                          child: SearchMapWidget(),
                        ),
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: SizedBox(
                            height: 40,
                            child: ListView(
                              padding: const EdgeInsets.only(left: 15),
                              scrollDirection: Axis.horizontal,
                              physics: const BouncingScrollPhysics(),
                              children: [
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<MapPageViewModel>().onSelectAllCategoryButtonPressed();
                                    _animatedMapMove(LatLng(43.0367, 44.6678), 12);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor: Colors.black.withOpacity(0.6),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  ),
                                  child: Text('Сбросить фильтры',
                                      style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14)),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<MapPageViewModel>().onSelectHousingCategoryButtonPressed();
                                    _animatedMapMove(LatLng(43.0367, 44.6678), 12);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor: Colors.black.withOpacity(0.6),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  ),
                                  child: Text('Жильё', style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14)),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<MapPageViewModel>().onSelectLocationCategoryButtonPressed();
                                    _animatedMapMove(LatLng(43.0367, 44.6678), 12);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor: Colors.black.withOpacity(0.6),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  ),
                                  child: Text('Локации/Еда', style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14)),
                                ),
                                const SizedBox(width: 10),
                                ElevatedButton(
                                  onPressed: () {
                                    context.read<MapPageViewModel>().onSelectEventCategoryButtonPressed();
                                    _animatedMapMove(LatLng(43.0367, 44.6678), 12);
                                  },
                                  style: ElevatedButton.styleFrom(
                                    shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15),
                                    ),
                                    backgroundColor: Colors.black.withOpacity(0.6),
                                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                                  ),
                                  child: Text('События', style: theme.textTheme.bodyLarge!.copyWith(fontSize: 14)),
                                ),
                              ],
                            ),
                          ),
                        )
                      ],
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
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontSize: 20, fontWeight: FontWeight.w500, color: theme.primaryColorDark),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              child: searchList.isEmpty
                                  ? const Center(child: Text('Введите место для поиска...'))
                                  : ListView.separated(
                                      separatorBuilder: (context, index) => const Divider(),
                                      itemCount: searchList.length,
                                      itemBuilder: (context, index) => InkWell(
                                        onTap: () {
                                          context.read<MapPageViewModel>().changeSearchState();
                                          context.read<MapPageViewModel>().changeSelectedPlace(searchList[index]);
                                          _animatedMapMove(
                                              LatLng(searchList[index].placeInfo.longitude.value,
                                                  searchList[index].placeInfo.latitude.value),
                                              17);
                                        },
                                        child: ListTile(
                                          leading: SizedBox(
                                              width: 32,
                                              height: 32,
                                              child: SvgPicture.asset('assets/images/map_item_icon.svg')),
                                          textColor: Colors.black,
                                          title: Text(searchList[index].placeInfo.name),
                                          trailing: const Icon(Icons.call_missed),
                                        ),
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
                                child: ListView(
                              children: [
                                ListTile(
                                    leading: SvgPicture.asset('assets/images/location_icon.svg'),
                                    title: const Text('Моё местоположение')),
                                ...context
                                    .read<MapPageViewModel>()
                                    .selectedPlaces
                                    .map((e) => ListTile(
                                          onTap: () {
                                            context.read<MapPageViewModel>().changeSelectedPlace(e);
                                            _animatedMapMove(
                                                LatLng(e.placeInfo.longitude.value, e.placeInfo.latitude.value), 17);
                                          },
                                          leading: SvgPicture.asset('assets/images/location_marker_icon.svg'),
                                          title: Text('${e.placeInfo.name}'),
                                        ))
                                    .toList()
                              ],
                            ))
                          ]),
                        ),
                        const SizedBox(
                          height: 5,
                        ),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.indicatorColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15), // Set custom border radius here
                                  ),
                                ),
                                onPressed: () => context
                                        .read<MapPageViewModel>()
                                        .onSelectDrivingRouteButtonPressed()
                                        .whenComplete(() {
                                      final polylinePoints = context.read<MapPageViewModel>().polylinePoints;
                                      _animatedMapMove(polylinePoints[polylinePoints.length ~/ 2], 14);
                                    }),
                                child: Row(
                                  children: [
                                    const Icon(Icons.directions_car),
                                    if (selectedRouteType == RouteType.driving) ...[
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      routeDuration == null
                                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator())
                                          : Text(formatMinutes(routeDuration)),
                                    ]
                                  ],
                                )),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  backgroundColor: theme.indicatorColor,
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(15), // Set custom border radius here
                                  ),
                                ),
                                onPressed: () =>
                                    context.read<MapPageViewModel>().onSelectFootRouteButtonPressed().whenComplete(() {
                                      final polylinePoints = context.read<MapPageViewModel>().polylinePoints;
                                      _animatedMapMove(polylinePoints[polylinePoints.length ~/ 2], 14);
                                    }),
                                child: Row(
                                  children: [
                                    const Icon(Icons.directions_walk),
                                    if (selectedRouteType == RouteType.foot) ...[
                                      const SizedBox(
                                        width: 5,
                                      ),
                                      routeDuration == null
                                          ? const SizedBox(width: 20, height: 20, child: CircularProgressIndicator())
                                          : Text(formatMinutes(routeDuration)),
                                    ]
                                  ],
                                )),
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
                    children: [
                      const ZoomButtons(),
                      const SizedBox(height: 15),
                      FloatingActionButton(
                        backgroundColor: Colors.black.withOpacity(0.6),
                        onPressed: () {
                          context.read<MapPageViewModel>().onLocationButtonPressed().whenComplete(
                              () => _animatedMapMove(context.read<MapPageViewModel>().currentLocationPosition!, 17));
                        },
                        child: SvgPicture.asset(
                          'assets/images/location_line_icon.svg',
                          color: Theme.of(context).cardColor,
                        ),
                      )
                    ],
                  )),
            selectedPlace != null && !isSearchOpened
                ? SlidingUpPanel(
                    controller: context.read<MapPageViewModel>().panelController,
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                    minHeight: MediaQuery.of(context).size.height * 0.3,
                    maxHeight: MediaQuery.of(context).size.height * 0.85,
                    backdropEnabled: true,
                    borderRadius: const BorderRadius.only(topLeft: Radius.circular(12), topRight: Radius.circular(12)),
                    panel: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Center(
                          child: Container(
                              height: 5,
                              width: 45,
                              decoration: const BoxDecoration(
                                  color: Colors.grey, borderRadius: BorderRadius.all(Radius.circular(15)))),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                        Row(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            Expanded(
                              child: Text(
                                '${selectedPlace.placeInfo.name}',
                                style: theme.textTheme.displayMedium!
                                    .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                              ),
                            ),
                            const SizedBox(width: 10),
                            ReviewRatingWidget(selectedModel: selectedPlace)
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Row(
                          children: [
                            SvgPicture.asset(
                              'assets/images/vector_icon.svg',
                              color: Colors.black,
                            ),
                            Text(
                              selectedPlace.placeInfo.adress.value,
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(15),
                            ),
                            backgroundColor: theme.highlightColor,
                          ),
                          onPressed: !context.read<MapPageViewModel>().selectedPositions.contains(selectedPosition)
                              ? () {
                                  context.read<MapPageViewModel>().onDrawRouteButtonPressed().whenComplete(() {
                                    context.read<MapPageViewModel>().panelController.close();
                                    final polylinePoints = context.read<MapPageViewModel>().polylinePoints;
                                    _animatedMapMove(polylinePoints[polylinePoints.length ~/ 2], 14);
                                  });
                                }
                              : null,
                          child: const Text('Маршрут'),
                        ),
                        const SizedBox(height: 5),
                        selectedPlace.placeInfo.photos.isNotEmpty
                            ? CarouselSlider.builder(
                                itemCount: selectedPlace.placeInfo.photos.length,
                                options: CarouselOptions(
                                  initialPage: selectedPlace.placeInfo.photos.length > 1 ? 1 : 0,
                                  enableInfiniteScroll: false,
                                  aspectRatio: 2.0,
                                  enlargeCenterPage: true,
                                ),
                                itemBuilder: (context, index, realIdx) {
                                  return Image.network(
                                    'http://176.119.159.9/media/${selectedPlace.placeInfo.photos[index]}',
                                    fit: BoxFit.cover,
                                    width: 1000,
                                  );
                                },
                              )
                            : SizedBox(
                                height: 230, child: Image.asset('assets/images/not_loaded.png', fit: BoxFit.cover)),
                        const SizedBox(height: 15),
                        if (selectedPlace.placeInfo.description.value != '') ...[
                          Text(
                            'Описание',
                            style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                  fontSize: 20,
                                  color: const Color.fromRGBO(44, 44, 46, 1),
                                  fontWeight: FontWeight.w500,
                                ),
                          ),
                          const SizedBox(height: 15),
                        ],
                        Expanded(
                          child: ListView(
                            physics: selectedPlace.placeInfo.description.value != ''
                                ? const ScrollPhysics()
                                : const NeverScrollableScrollPhysics(),
                            padding: const EdgeInsets.only(bottom: 15),
                            children: [
                              if (selectedPlace.placeInfo.description.value != '') ...[
                                Text(
                                  '${selectedPlace.placeInfo.description.value}',
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                                ),
                                const SizedBox(height: 10),
                              ],
                              if (selectedPlace.placeInfo.mail.isValid ||
                                  selectedPlace.placeInfo.number.isValid ||
                                  selectedPlace.placeInfo.url.isValid) ...[
                                Text(
                                  'Контакты',
                                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                        fontSize: 20,
                                        color: const Color.fromRGBO(44, 44, 46, 1),
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                const SizedBox(height: 15),
                              ],
                              if (selectedPlace.placeInfo.number.isValid) ...[
                                ContactPhoneWidget(
                                    phoneNumber: selectedPlace.placeInfo.number.value,
                                    text: selectedPlace.placeInfo.number.value),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                              if (selectedPlace.placeInfo.mail.isValid) ...[
                                ContactEmailWidget(text: selectedPlace.placeInfo.mail.value),
                                const SizedBox(
                                  height: 5,
                                )
                              ],
                              if (selectedPlace.placeInfo.url.isValid)
                                ContactWebsiteWidget(websiteUrl: selectedPlace.placeInfo.url.value),
                              const SizedBox(height: 15),
                            ],
                          ),
                        ),
                      ],
                    ))
                : const SizedBox.shrink(),
          ]),
        );
      }),
    );
  }
}
