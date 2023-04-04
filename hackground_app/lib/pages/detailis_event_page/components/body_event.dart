import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';

import '../../../data/network/models/entity/event_entity.dart';
import '../../../widgets/contact_email_widget.dart';
import '../../../widgets/contact_phone_widget.dart';
import '../../../widgets/contact_website_widget.dart';
import '../../../widgets/image_slider.dart';
import 'duration_event_widget.dart';
import 'price_event_widget.dart';

class BodyEvent extends StatelessWidget {
  const BodyEvent({
    Key? key,
    required this.selectedModel,
  }) : super(key: key);

  final EventsEntity selectedModel;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ListView(
      padding: const EdgeInsets.only(bottom: 15),
      children: [
        ImageSlider(
          urlImages: selectedModel.placeInfo.photos!.map((e) => 'http://176.119.159.9/media/$e').toList(),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 15, right: 15, top: 15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedModel.placeInfo.name,
                style: theme.textTheme.displayMedium!
                    .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              DurationEventWidget(selectedModel: selectedModel),
              const SizedBox(height: 15),
              PriceEventWidget(selectedModel: selectedModel),
              const SizedBox(height: 15),
              if (selectedModel.placeInfo.description.value != '' && selectedModel.placeInfo.description.isValid) ...[
                Text(
                  tr('description_text'),
                  style: theme.textTheme.displayMedium!
                      .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  selectedModel.placeInfo.description.value,
                  style:
                      theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                ),
                const SizedBox(
                  height: 25,
                ),
              ],
              Text(
                tr('location_text'),
                style: theme.textTheme.displayMedium!
                    .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              const SizedBox(
                height: 15,
              ),
              Row(
                children: [
                  SvgPicture.asset(
                    'assets/images/vector_icon.svg',
                    color: Colors.black,
                  ),
                  Text(
                    selectedModel.placeInfo.adress.value,
                    style:
                        theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                  ),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              ClipRRect(
                borderRadius: BorderRadius.circular(15),
                child: SizedBox(
                  height: 200,
                  child: FlutterMap(
                    options: MapOptions(
                        absorbPanEventsOnScrollables: false,
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
              const SizedBox(
                height: 30,
              ),
              if (selectedModel.placeInfo.url.isValid ||
                  selectedModel.placeInfo.number.isValid ||
                  selectedModel.placeInfo.mail.isValid)
                Text(
                  tr('contacts_text'),
                  style: theme.textTheme.displayMedium!
                      .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                ),
              const SizedBox(
                height: 15,
              ),
              if (selectedModel.placeInfo.url.isValid) ...[
                ContactWebsiteWidget(websiteUrl: selectedModel.placeInfo.url.value),
                const SizedBox(
                  height: 10,
                ),
              ],
              if (selectedModel.placeInfo.number.isValid) ...[
                ContactPhoneWidget(
                    phoneNumber: selectedModel.placeInfo.number.value, text: selectedModel.placeInfo.number.value),
                const SizedBox(
                  height: 10,
                ),
              ],
              if (selectedModel.placeInfo.mail.isValid) ...[
                ContactEmailWidget(text: selectedModel.placeInfo.mail.value),
                const SizedBox(
                  height: 15,
                ),
              ],
            ],
          ),
        )
      ],
    );
  }
}
