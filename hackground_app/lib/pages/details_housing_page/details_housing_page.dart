import 'package:flutter/material.dart';
import 'package:flutter_map/flutter_map.dart';
import 'package:flutter_svg/svg.dart';
import 'package:latlong2/latlong.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../app_localizations.dart';
import '../../data/network/models/entity/housing_entity.dart';
import '../../widgets/contact_email_widget.dart';
import '../../widgets/contact_phone_widget.dart';
import '../../widgets/contact_website_widget.dart';
import '../../widgets/housing_small_listview.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/name_row_header.dart';
import 'components/review_housing_list.dart';
import 'components/sent_review_button.dart';
import 'details_page_model.dart';

class DetailsHousingPage extends StatelessWidget {
  final HousingEntity selectedModel;
  const DetailsHousingPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => DetailsHousingPageViewModel(context.read<InitializeProvider>().cachedDataRepository,
          context.read<InitializeProvider>().housingService, selectedModel.placeInfo.id),
      child: Builder(builder: (context) {
        final reviews = context.select((DetailsHousingPageViewModel model) => model.reviews);
        return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                highlightColor: theme.cardColor,
                splashRadius: 15,
                icon: SvgPicture.asset(
                  'assets/images/back_arrow_icon.svg',
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                selectedModel.placeInfo.name,
                style: theme.textTheme.displayMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: theme.primaryColorLight,
            ),
            body: ListView(
              children: [
                ImageSlider(
                  urlImages: selectedModel.placeInfo.photos!.map((e) => 'http://176.119.159.9/media/$e').toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedModel.placeInfo.name,
                        style: theme.textTheme.displayMedium!
                            .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
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
                              'от ${selectedModel.price.value} ₽ за ночь',
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 15,
                        ),
                      ],
                      Text(
                        translate(context, 'description_text'),
                        style: theme.textTheme.displayMedium!
                            .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        selectedModel.placeInfo.description.value,
                        style: theme.textTheme.bodyLarge!
                            .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 25,
                      ),
                      Text(
                        translate(context, 'location_text'),
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
                            style: theme.textTheme.bodyLarge!
                                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
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
                      Text(
                        translate(context, 'contacts_text'),
                        style: theme.textTheme.displayMedium!
                            .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      ContactWebsiteWidget(websiteUrl: selectedModel.placeInfo.url.value),
                      const SizedBox(
                        height: 10,
                      ),
                      ContactPhoneWidget(
                          phoneNumber: selectedModel.placeInfo.number.value,
                          text: selectedModel.placeInfo.number.value),
                      const SizedBox(
                        height: 10,
                      ),
                      ContactEmailWidget(text: selectedModel.placeInfo.mail.value),
                      const SizedBox(
                        height: 15,
                      ),
                      if (reviews.isNotEmpty) ...[
                        NameRowHeader(
                          name: translate(context, 'reviews_text'),
                        ),
                        const SizedBox(
                          height: 15,
                        ),
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
                                  '${selectedModel.placeInfo.meanRating.value}',
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
                              '${selectedModel.placeInfo.ratingCount.value.toInt()} отзывов',
                              style: theme.textTheme.bodyLarge!
                                  .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                            ),
                          ],
                        ),
                        const SizedBox(
                          height: 10,
                        ),
                        const ReviewHousingList(),
                        const SizedBox(
                          height: 15,
                        ),
                      ] else ...[
                        const Center(
                          child: Text('Отзывов еще нет, будьте первым!'),
                        ),
                        const SizedBox(
                          height: 15,
                        )
                      ],
                      const SentReviewButton(),
                      const SizedBox(
                        height: 30,
                      ),
                      NameRowHeader(name: translate(context, 'also_recommended')),
                      const SizedBox(
                        height: 15,
                      ),
                      HousingSmallListView(
                          housings: context
                              .read<DetailsHousingPageViewModel>()
                              .housings
                              .where((element) => element.placeInfo.id != selectedModel.placeInfo.id)
                              .toList()),
                    ],
                  ),
                ),
              ],
            ));
      }),
    );
  }
}
