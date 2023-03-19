import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

import '../../../data/network/models/entity/event_entity.dart';
import '../../../widgets/image_slider.dart';
import '../../../widgets/name_row_header_events.dart';
import '../../details_housing_page/components/sent_review_button.dart';
import 'contact_event_widget.dart';
import 'duration_event_widget.dart';
import 'price_event_widget.dart';
import 'review_event_widget.dart';
import 'url_event_widget.dart';

class BodyEvent extends StatelessWidget {
  const BodyEvent({
    Key? key,
    required this.selectedModel,
    required this.theme,
    required this.isFullTextShowed,
  }) : super(key: key);

  final EventsEntity selectedModel;
  final ThemeData theme;
  final bool isFullTextShowed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImageSlider(
          urlImages: selectedModel.placeInfo.photos!.map((e) => 'http://176.119.159.9/media/$e').toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedModel.placeInfo.name,
                style: theme.textTheme.displayMedium!
                    .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              DurationEventWidget(theme: theme),
              const SizedBox(height: 15),
              PriceEventWidget(theme: theme),
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
              Text(
                selectedModel.placeInfo.description.value,
                style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 30),
              Text(
                'Местоположение',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 15),
              Text(
                'КЗ СОГУ, ул. Бутырина, 37 • 95 м',
                style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 10),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 200,
                  child: FlutterMap(
                    options: MapOptions(
                        interactiveFlags: InteractiveFlag.pinchZoom | InteractiveFlag.drag,
                        center: LatLng(
                          selectedModel.placeInfo.longitude.value,
                          selectedModel.placeInfo.latitude.value,
                        ),
                        zoom: 16,
                        maxZoom: 17,
                        minZoom: 8),
                    children: [
                      TileLayer(
                        urlTemplate: 'https://osm.rrze.fau.de/osmhd/{z}/{x}/{y}.png',
                        userAgentPackageName: 'com.example.hackground_app',
                        subdomains: const [
                          'a',
                          'b',
                        ],
                      ),
                      MarkerLayer(
                        markers: [
                          Marker(
                              point: LatLng(
                                selectedModel.placeInfo.longitude.value,
                                selectedModel.placeInfo.latitude.value,
                              ),
                              builder: (_) => SvgPicture.asset('assets/images/location_marker_icon.svg'))
                        ],
                      )
                    ],
                  ),
                ),
              ),
              const SizedBox(height: 30),
              Text(
                'Контакты',
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 15),
              ContactEventWidget(theme: theme),
              const SizedBox(height: 10),
              UrlEventWidget(theme: theme),
              const SizedBox(height: 30),
              // const NameRowHeader(
              //   name: 'Отзывы',
              // ),
              const SizedBox(height: 15),
              ReviewEventWidget(theme: theme),
              const SizedBox(height: 10),
              // SizedBox(
              //   height: 180,
              //   child: ListView.builder(
              //       scrollDirection: Axis.horizontal,
              //       itemCount: 8,
              //       itemBuilder: (context, index) => ReviewCard(
              //             review: reviewList[0],
              //           )),
              // ),
              const SizedBox(height: 15),
              const SentReviewButton(),
              const SizedBox(height: 30),
              const NameRowHeaderEvents(name: 'Также рекомендуем'),
              const SizedBox(height: 15),
            ],
          ),
        )
      ],
    );
  }
}
