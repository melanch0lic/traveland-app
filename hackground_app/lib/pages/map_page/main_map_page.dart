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
import 'components/map_category_select_widget.dart';
import 'components/map_widget.dart';
import 'components/search_map_widget.dart';
import 'components/search_opened_widget.dart';
import 'components/zoom_buttons.dart';
import 'map_page_model.dart';

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
        final items = context.select((MapPageViewModel model) => model.items);
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
                    firstChild: Padding(
                      padding: const EdgeInsets.all(15),
                      child: Column(
                        children: const [
                          SearchMapWidget(),
                          SizedBox(height: 5),
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
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(fontSize: 20, fontWeight: FontWeight.w500, color: theme.primaryColorDark),
                            ),
                            const SizedBox(
                              height: 10,
                            ),
                            Flexible(
                              child: ListView.separated(
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
                                          : Text('$routeDuration минут'),
                                    ]
                                  ],
                                )),
                            const SizedBox(
                              width: 30,
                            ),
                            ElevatedButton(
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
                                          : Text('$routeDuration минут'),
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
                    padding: const EdgeInsets.only(top: 10, left: 15, right: 15),
                    minHeight: MediaQuery.of(context).size.height * 0.2,
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
                            Row(
                              children: [
                                Container(
                                  width: 42,
                                  height: 27,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(7),
                                    color: const Color.fromRGBO(56, 176, 0, 1),
                                  ),
                                  child: Padding(
                                    padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
                                    child: Text(
                                      selectedPlace.placeInfo.meanRating.value.toStringAsFixed(1),
                                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                                            color: const Color.fromRGBO(255, 255, 255, 1),
                                            fontSize: 14,
                                          ),
                                    ),
                                  ),
                                ),
                                const SizedBox(
                                  width: 5,
                                ),
                                Text(
                                  '${selectedPlace.placeInfo.ratingCount.value} отзывов',
                                  style: theme.textTheme.bodyLarge!
                                      .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                                ),
                              ],
                            )
                          ],
                        ),
                        const SizedBox(
                          width: 5,
                        ),
                        Text(
                          '${selectedPlace.placeInfo.adress.value}',
                          style: theme.textTheme.bodyLarge!
                              .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
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
                                    final polylinePoints = context.read<MapPageViewModel>().polylinePoints;
                                    _animatedMapMove(polylinePoints[polylinePoints.length ~/ 2], 14);
                                  });
                                }
                              : null,
                          child: const Text('Маршрут'),
                        ),
                        const SizedBox(height: 5),
                        CarouselSlider.builder(
                          itemCount: selectedPlace.placeInfo.photos.length,
                          options: CarouselOptions(
                            initialPage: selectedPlace.placeInfo.photos.length > 1 ? 1 : 0,
                            enableInfiniteScroll: false,
                            aspectRatio: 2.0,
                            enlargeCenterPage: true,
                          ),
                          itemBuilder: (context, index, realIdx) {
                            return Image.network('http://176.119.159.9/media/${selectedPlace.placeInfo.photos[index]}',
                                fit: BoxFit.cover, width: 1000);
                          },
                        ),
                        const SizedBox(height: 15),
                        Text(
                          'Описание',
                          style: Theme.of(context).textTheme.displayLarge?.copyWith(
                                fontSize: 20,
                                color: const Color.fromRGBO(44, 44, 46, 1),
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 15),
                        Expanded(
                          child: ListView(
                            padding: const EdgeInsets.only(bottom: 15),
                            children: [
                              Text(
                                '${selectedPlace.placeInfo.description.value}',
                                style: theme.textTheme.bodyLarge!
                                    .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                              ),
                              const SizedBox(height: 10),
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
