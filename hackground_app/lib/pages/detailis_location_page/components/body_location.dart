import 'package:flutter/material.dart';
import 'package:hackground_app/pages/detailis_location_page/components/price_location_widget.dart';
import 'package:hackground_app/pages/detailis_location_page/components/show_description_location_widget.dart';
import 'package:hackground_app/pages/detailis_location_page/components/time_location_widget.dart';

import '../../../data/network/models/entity/place_entity.dart';
import '../../../dummy_data.dart';
import '../../../widgets/image_slider.dart';
import '../../../widgets/name_row_header.dart';
import '../../../widgets/name_row_header_places.dart';
import '../../detailis_event_page/components/review_event_widget.dart';
import '../../detailis_exursion_page/components/route_map.dart';
import '../../details_page/components/review_card.dart';
import '../../details_page/components/sent_review_button.dart';
import 'contact_location_widget.dart';
import 'description_location_widget.dart';

class BodyLocation extends StatelessWidget {
  const BodyLocation({
    Key? key,
    required this.selectedModel,
    required this.theme,
    required this.isFullTextShowed,
  }) : super(key: key);

  final PlaceEntity selectedModel;
  final ThemeData theme;
  final bool isFullTextShowed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImageSlider(
          urlImages: const [
            'https://i.pinimg.com/564x/59/fa/0c/59fa0cbe6745f482b5df4bbb08d371df.jpg',
            'https://i.pinimg.com/564x/09/25/19/092519cf8a856ecd8427ed4e38dc77dc.jpg'
          ],
        ),
        Padding(
          padding: const EdgeInsets.all(15.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedModel.placeInfo.name,
                style: theme.textTheme.headline2!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              TimeLocationWidget(theme: theme),
              const SizedBox(height: 15),
              PriceLocationWidget(theme: theme, selectedModel: selectedModel),
              const SizedBox(height: 30),
              Text(
                'Описание',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 15),
              DescriptionLocationWidget(
                  selectedModel: selectedModel,
                  theme: theme,
                  isFullTextShowed: isFullTextShowed),
              const SizedBox(height: 10),
              ShowDescriptionLocationWidget(
                  theme: theme, isFullTextShowed: isFullTextShowed),
              const SizedBox(height: 30),
              Text(
                'Местоположение',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 15),
              Text(
                selectedModel.placeInfo.adress,
                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                    ),
              ),
              const SizedBox(height: 10),
              const RouteMap(),
              const SizedBox(height: 30),
              Text(
                'Контакты',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 15),
              ContactLocationWidget(theme: theme),
              const NameRowHeader(name: 'Отзывы'),
              const SizedBox(height: 15),
              ReviewEventWidget(theme: theme),
              const SizedBox(height: 10),
              SizedBox(
                height: 180,
                child: ListView.builder(
                    scrollDirection: Axis.horizontal,
                    itemCount: 8,
                    itemBuilder: (context, index) => ReviewCard(
                          review: reviewList[0],
                        )),
              ),
              const SizedBox(height: 15),
              const SentReviewButton(),
              const SizedBox(height: 30),
              const NameRowHeaderPlaces(name: 'Также рекомендуем'),
              const SizedBox(height: 15),
            ],
          ),
        )
      ],
    );
  }
}
