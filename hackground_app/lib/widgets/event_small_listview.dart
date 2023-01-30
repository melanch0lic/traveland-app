import 'package:flutter/cupertino.dart';

import '../data/network/models/entity/event_entity.dart';

import '../pages/home_page/components/attraction_card_general.dart';

class EventSmallListView extends StatelessWidget {
  final List<EventsEntity> events;

  const EventSmallListView({Key? key, required this.events}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: ListView.builder(
        physics: const BouncingScrollPhysics(),
        scrollDirection: Axis.horizontal,
        itemBuilder: (context, index) => EventSmallCard(events[index]),
        itemCount: events.length,
      ),
    );
  }
}
