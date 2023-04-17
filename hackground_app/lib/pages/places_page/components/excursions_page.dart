import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../widgets/up_scroll_widget.dart';
import '../places_page_model.dart';
import 'excursion_card.dart';
import 'filter_header_excursions.dart';

class ExcursionsPage extends StatelessWidget {
  const ExcursionsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Widget> sortList = [
      ListTile(
        onTap: () => context.read<PlacesPageViewModel>().sortExcursionsParametersChange('popularity'),
        title: Text(
          'По популярности',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
        ),
      ),
      ListTile(
        onTap: () => context.read<PlacesPageViewModel>().sortExcursionsParametersChange('price'),
        title: Text(
          'По цене',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
        ),
      ),
    ];
    final isLoadingMore = context.select((PlacesPageViewModel model) => model.isExcursionsLoadingMore);
    final isLoading = context.select((PlacesPageViewModel model) => model.isExcursionsLoading);
    final sortFlag = context.select((PlacesPageViewModel model) => model.sortFlagExcursions);
    final excursions = context.select((PlacesPageViewModel model) => model.excursions);
    final isExcursionButtonShow = context.select((PlacesPageViewModel model) => model.isExcursionsButtonShow);
    return isLoading
        ? Center(
            child: SpinKitSpinningLines(color: theme.indicatorColor),
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
                      child: Stack(children: [
                    ClipRRect(
                      borderRadius: BorderRadius.circular(15),
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
                                )),
                    ),
                    sortFlag
                        ? Align(
                            alignment: Alignment.topLeft,
                            child: Container(
                              decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(15),
                                  color: Colors.white,
                                  boxShadow: const [
                                    BoxShadow(
                                      color: Color.fromRGBO(149, 157, 165, 0.25),
                                      spreadRadius: 5,
                                      blurRadius: 7,
                                      offset: Offset(0, 3),
                                    ),
                                  ]),
                              child: ListView.separated(
                                  physics: const BouncingScrollPhysics(),
                                  shrinkWrap: true,
                                  itemBuilder: (context, index) => sortList[index],
                                  separatorBuilder: (context, index) => const Divider(),
                                  itemCount: sortList.length),
                            ),
                          )
                        : const SizedBox.shrink(),
                  ])),
                ],
              ),
            ),
            if (isExcursionButtonShow)
              UpScrollWidget(callback: () {
                context
                    .read<PlacesPageViewModel>()
                    .excursionController
                    .animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
              }),
          ]);
  }
}
