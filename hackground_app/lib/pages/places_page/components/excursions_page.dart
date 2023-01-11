import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../places_page_model.dart';
import 'excursion_card.dart';
import 'filter_header_excursions.dart';

class ExcursionsPage extends StatelessWidget {
  const ExcursionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoadingMore = context.select((PlacesPageViewModel model) => model.isExcursionsLoadingMore);
    final isLoading = context.select((PlacesPageViewModel model) => model.isExcursionsLoading);
    final excursions = context.select((PlacesPageViewModel model) => model.excursions);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Stack(children: [
            Padding(
              padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
              child: Column(
                children: [
                  const FilterHeaderExcursions(),
                  const SizedBox(
                    height: 15,
                  ),
                  Expanded(
                      child: ListView.builder(
                          controller: context.read<PlacesPageViewModel>().excursionController,
                          physics: const BouncingScrollPhysics(),
                          itemCount: excursions.length,
                          itemBuilder: (context, index) => excursions.length == index + 1
                              ? Column(
                                  children: [
                                    ExcursionCard(excursion: excursions[index]),
                                    if (isLoadingMore) const CircularProgressIndicator()
                                  ],
                                )
                              : ExcursionCard(
                                  excursion: excursions[index],
                                ))),
                ],
              ),
            ),
            Positioned(
              bottom: 5,
              right: 5,
              child: FloatingActionButton.extended(
                  onPressed: () {
                    context
                        .read<PlacesPageViewModel>()
                        .excursionController
                        .animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                  },
                  label: const Icon(Icons.arrow_circle_up)),
            )
          ]);
  }
}
