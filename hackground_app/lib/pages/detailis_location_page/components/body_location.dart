import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../../data/network/models/entity/place_entity.dart';
import '../../../widgets/contact_email_widget.dart';
import '../../../widgets/contact_phone_widget.dart';
import '../../../widgets/contact_website_widget.dart';
import '../../../widgets/image_slider.dart';
import '../../../widgets/location_small_listview.dart';
import '../../../widgets/name_row_header_housing.dart';
import '../../../widgets/review_housing_list.dart';
import '../../../widgets/reviews_rating_widget.dart';
import '../../../widgets/sent_review_button.dart';
import '../detailis_location_model_page.dart';
import 'time_location_widget.dart';

class BodyLocation extends StatelessWidget {
  const BodyLocation({
    Key? key,
    required this.selectedModel,
    required this.theme,
  }) : super(key: key);

  final PlaceEntity selectedModel;
  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final reviews = context.select((DetailsLocationPageViewModel model) => model.reviews);
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
              TimeLocationWidget(theme: theme),
              const SizedBox(height: 15),
              if (selectedModel.price.isValid) ...[
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/wallet_icon.svg',
                      color: theme.primaryColorDark,
                    ),
                    const SizedBox(
                      width: 5,
                    ),
                    Text(
                      'от ${selectedModel.price.value} ₽',
                      style: theme.textTheme.bodyLarge!
                          .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                    )
                  ],
                ),
                const SizedBox(
                  height: 15,
                ),
              ],
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
                style: theme.textTheme.displayLarge?.copyWith(
                  fontSize: 20,
                  color: const Color.fromRGBO(44, 44, 46, 1),
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                selectedModel.placeInfo.adress.value,
                style: theme.textTheme.bodyMedium?.copyWith(
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
              const SizedBox(height: 15),
              if (reviews.isNotEmpty) ...[
                NameRowHeaderReviewDetails(
                  selectedModel: selectedModel,
                  reviews: reviews,
                ),
                const SizedBox(
                  height: 15,
                ),
                ReviewRatingWidget(selectedModel: selectedModel),
                const SizedBox(
                  height: 10,
                ),
                ReviewSmallList(
                  reviews: reviews,
                ),
                const SizedBox(
                  height: 15,
                ),
              ] else ...[
                Center(
                  child: Text(
                    'Отзывов еще нет, будьте первым!',
                    style: theme.textTheme.bodyMedium,
                  ),
                ),
                const SizedBox(
                  height: 15,
                )
              ],
              SentReviewButton(
                placeId: selectedModel.placeInfo.id,
              ),
              const SizedBox(
                height: 30,
              ),
              LocationSmallListView(
                  places: context
                      .read<DetailsLocationPageViewModel>()
                      .places
                      .where((element) => element.placeInfo.id != selectedModel.placeInfo.id)
                      .toList()),
            ],
          ),
        )
      ],
    );
  }
}
