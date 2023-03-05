import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_localizations.dart';
import '../../../data/network/models/entity/tour_entity.dart';
import '../../../widgets/excursion_small_listview.dart';
import '../../../widgets/image_slider.dart';
import '../../../widgets/name_row_header_excursions.dart';
import '../detailis_exursion_page_model.dart';
import 'contact_tripster_widget.dart';
import 'description_excursion_widget.dart';
import 'duration_excursion_widget.dart';
import 'info_guide_widget.dart';
import 'name_row_header_exursion.dart';
import 'price_excursion_widget.dart';
import 'provided-by-tripster-or-not_widget.dart';
import 'review_excursion_list.dart';
import 'review_exursion_widget.dart';
import 'show_description_excursion_widget.dart';

class BodyExcursion extends StatelessWidget {
  const BodyExcursion({
    Key? key,
    required this.selectedModel,
  }) : super(key: key);

  final TourEntity selectedModel;

  @override
  Widget build(BuildContext context) {
    final isFullTextShowed = context.select(
      (DetailsExursionPageViewModel model) => model.isFullTextShowed,
    );
    final theme = Theme.of(context);
    final isLoading = context.select((DetailsExursionPageViewModel model) => model.isLoading);
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
                style: theme.textTheme.displayMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              const SizedBox(height: 10),
              const ProvidedByTripsterOrNotWidget(),
              const SizedBox(height: 10),
              DurationExcursionWidget(selectedModel: selectedModel),
              const SizedBox(height: 15),
              PriceExcursionWidget(
                selectedModel: selectedModel,
              ),
              const SizedBox(height: 30),
              Text(
                translate(context, 'description_text'),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
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
                translate(context, 'guide_text'),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 15),
              InfoGuideWidget(selectedModel: selectedModel),
              const SizedBox(height: 30),
              Text(
                translate(context, 'contacts_text'),
                style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      fontSize: 20,
                      color: const Color.fromRGBO(44, 44, 46, 1),
                      fontWeight: FontWeight.w500,
                    ),
              ),
              const SizedBox(height: 15),
              ContactTripsterWidget(url: selectedModel.url),
              const SizedBox(height: 15),
              NameRowHeaderExursion(selectedModel: selectedModel),
              ReviewExursionWidget(selectedModel: selectedModel),
              const SizedBox(height: 10),
              if (!isLoading) const ReviewExcursionList(),
              const SizedBox(height: 15),
              NameRowHeaderExcursions(name: translate(context, 'also_recommended')),
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
            ],
          ),
        ),
      ],
    );
  }
}
