import 'package:flutter/material.dart';
import 'package:hackground_app/pages/hubs_page/components/event_card.dart';
import 'package:hackground_app/pages/hubs_page/components/header_hubs.dart';
import 'package:hackground_app/pages/hubs_page/components/hubs_buttons.dart';

import '../../widgets/appbar.dart';
import '../../widgets/search_widget.dart';

class HubsPage extends StatelessWidget {
  const HubsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 12),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                CustomAppBar(),
                SearchWidget(),
                HubsHeader(text: 'Хабы'),
                SizedBox(
                  height: 20,
                ),
                HubsButtons(),
                SizedBox(
                  height: 20,
                ),
                HubsHeader(text: 'Общедоступные'),
                EventCard()
              ],
            ),
          ),
        ),
      ),
    );
  }
}
