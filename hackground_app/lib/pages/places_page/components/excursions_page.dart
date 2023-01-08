import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../places_page_model.dart';
import 'excursion_card.dart';
import 'filter_header_excursions.dart';

class ExcursionsPage extends StatelessWidget {
  const ExcursionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((PlacesPageViewModel model) => model.isExcursionsLoading);
    final excursions = context.select((PlacesPageViewModel model) => model.excursions);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
            child: Column(
              children: [
                const FilterHeaderExcursions(),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.builder(
                        physics: const BouncingScrollPhysics(),
                        itemCount: excursions.length,
                        itemBuilder: (context, index) => ExcursionCard(
                              excursion: excursions[index],
                            ))),
              ],
            ),
          );
  }
}
