import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../places_page_model.dart';
import 'event_card.dart';
import 'filter_header_events.dart';

class EventsPage extends StatelessWidget {
  const EventsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final isLoading = context.select((PlacesPageViewModel model) => model.isEventsLoading);
    final events = context.select((PlacesPageViewModel model) => model.events);
    return isLoading
        ? const Center(
            child: CircularProgressIndicator(),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              children: [
                const FilterHeaderEvents(),
                const SizedBox(
                  height: 15,
                ),
                Expanded(
                    child: ListView.builder(
                        itemCount: events.length,
                        itemBuilder: (context, index) => EventCard(
                              event: events[index],
                            )))
              ],
            ),
          );
  }
}
