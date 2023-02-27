import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../data/network/models/entity/tour_entity.dart';
import '../../../dummy_data.dart';
import '../../../widgets/excursion_small_listview.dart';
import '../../../widgets/image_slider.dart';
import '../../../widgets/name_row_header_excursions.dart';
import '../../details_page/components/review_card.dart';
import '../../review_page/components/sent_review_button_excursions.dart';
import '../detailis_exursion_page_model.dart';
import 'contact_exursion_widget.dart';
import 'description_excursion_widget.dart';
import 'duration_excursion_widget.dart';
import 'info_guide_widget.dart';
import 'name_row_header_exursion.dart';
import 'price_excursion_widget.dart';
import 'provided-by-tripster-or-not_widget.dart';
import 'review_exursion_widget.dart';
import 'route_map.dart';
import 'show_description_excursion_widget.dart';

class BodyExcursion extends StatelessWidget {
  const BodyExcursion({
    Key? key,
    required this.selectedModel,
    required this.theme,
    required this.isFullTextShowed,
  }) : super(key: key);

  final TourEntity selectedModel;
  final ThemeData theme;
  final bool isFullTextShowed;

  @override
  Widget build(BuildContext context) {
    return ListView(
      children: [
        ImageSlider(
          urlImages: selectedModel.photos.map((e) => e.mediumAvatarUrl).toList(),
        ),
        Padding(
          padding: const EdgeInsets.all(15),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                selectedModel.title,
                style: theme.textTheme.headline2!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const ProvidedByTripsterOrNotWidget(),
              const SizedBox(height: 10),
              DurationExcursionWidget(
                theme: theme,
                selectedModel: selectedModel,
              ),
              const SizedBox(height: 15),
              PriceExcursionWidget(
                theme: theme,
                selectedModel: selectedModel,
              ),
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
              DescriptionExcursionWidget(
                selectedModel: selectedModel,
                theme: theme,
                isFullTextShowed: isFullTextShowed,
              ),
              ShowDescriptionExcursionWidget(
                theme: theme,
                isFullTextShowed: isFullTextShowed,
              ),
              const SizedBox(height: 30),
              Text(
                'Маршрут',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 15),
              const RouteMap(),
              const SizedBox(height: 30),
              Text(
                'Экскурсовод',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 15),
              InfoGuideWidget(selectedModel: selectedModel),
              const SizedBox(height: 30),
              Text(
                'Контакты',
                style: Theme.of(context).textTheme.headline1?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 16),
              ContactExursionWidget(theme: theme),
              const SizedBox(height: 30),
              NameRowHeaderExursion(
                name: 'Отзывы',
                selectedModel: selectedModel,
              ),
              ReviewExursionWidget(selectedModel: selectedModel, theme: theme),
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
              const SizedBox(
                height: 15,
              ),
              const SentReviewButtonExcursions(),
              const SizedBox(
                height: 30,
              ),
              const NameRowHeaderExcursions(name: 'Также рекомендуем'),
              const SizedBox(
                height: 15,
              ),
              ExcursionSmallListView(
                excursions: context
                    .read<DetailsExursionPageViewModel>()
                    .excursions
                    .where((element) => element.id != selectedModel.id)
                    .toList(),
              )
              // ExcursionSmallListView(excursions: excursions),
            ],
          ),
        ),
      ],
    );
  }
}
