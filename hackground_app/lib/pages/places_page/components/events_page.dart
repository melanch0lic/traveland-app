import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../../widgets/socket_error_widget.dart';
import '../../../widgets/up_scroll_widget.dart';
import '../places_page_model.dart';
import 'event_card.dart';
import 'filter_header_events.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<Widget> sortList = [
      ListTile(
        onTap: () => context.read<PlacesPageViewModel>().sortEventsParametersChange('name', 'asc'),
        title: Text(
          'По названию',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
        ),
      ),
      ListTile(
        onTap: () => context.read<PlacesPageViewModel>().sortEventsParametersChange('avg_rating', 'asc'),
        title: Text(
          'По рейтингу',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
        ),
      ),
      ListTile(
        onTap: () => context.read<PlacesPageViewModel>().sortEventsParametersChange('rating_count', 'desc'),
        title: Text(
          'По количеству отзывов',
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(fontSize: 16, color: Colors.black),
        ),
      ),
    ];
    final isLoading = context.select((PlacesPageViewModel model) => model.isEventsLoading);
    final isConnected = context.select((PlacesPageViewModel model) => model.isConnectedEvents);
    final sortFlag = context.select((PlacesPageViewModel model) => model.sortFlagEvents);
    final events = context.select((PlacesPageViewModel model) => model.events);
    final isEventsButtonShow = context.select((PlacesPageViewModel model) => model.isEventButtonShow);
    return isLoading
        ? Center(
            child: SpinKitSpinningLines(color: theme.indicatorColor),
          )
        : isConnected
            ? Stack(children: [
                Padding(
                  padding: const EdgeInsets.only(top: 30, left: 15, right: 15),
                  child: Column(
                    children: [
                      const FilterHeaderEvents(),
                      const SizedBox(
                        height: 15,
                      ),
                      Expanded(
                          child: Stack(children: [
                        ClipRRect(
                          borderRadius: BorderRadius.circular(15),
                          child: ListView.builder(
                              controller: context.read<PlacesPageViewModel>().eventController,
                              physics: const BouncingScrollPhysics(),
                              itemCount: events.length,
                              itemBuilder: (context, index) => EventCard(
                                    event: events[index],
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
                if (isEventsButtonShow)
                  UpScrollWidget(callback: () {
                    context
                        .read<PlacesPageViewModel>()
                        .eventController
                        .animateTo(0, duration: const Duration(seconds: 1), curve: Curves.easeInOut);
                  }),
              ])
            : SocketErrorWidget(callback: () => context.read<PlacesPageViewModel>().refreshEvents());
  }
}
