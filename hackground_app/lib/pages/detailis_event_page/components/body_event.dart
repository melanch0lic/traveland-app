import 'package:flutter/material.dart';
import 'package:hackground_app/pages/detailis_event_page/components/duration_event_widget.dart';
import 'package:hackground_app/pages/detailis_event_page/components/price_event_widget.dart';
import 'package:hackground_app/pages/detailis_event_page/components/review_event_widget.dart';
import 'package:hackground_app/pages/detailis_event_page/components/show_description_event_widget.dart';
import 'package:hackground_app/pages/detailis_event_page/components/url_event_widget.dart';
import 'package:provider/provider.dart';

import '../../../data/network/models/entity/event_entity.dart';
import '../../../dummy_data.dart';
import '../../../widgets/event_small_listview.dart';
import '../../../widgets/image_slider.dart';
import '../../../widgets/name_row_header.dart';
import '../../../widgets/name_row_header_events.dart';
import '../../../widgets/name_row_header_housing.dart';
import '../../detailis_exursion_page/components/route_map.dart';
import '../../details_page/components/review_card.dart';
import '../../details_page/components/sent_review_button.dart';
import '../detailis_event_page_model.dart';
import 'contact_event_widget.dart';
import 'description_event_widget.dart';

class BodyEvent extends StatelessWidget {
  const BodyEvent({
    Key? key,
    required this.selectedModel,
    required this.theme,
    required this.isFullTextShowed,
  }) : super(key: key);

  final EventsEntity selectedModel;
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
                '${selectedModel.placeInfo.name} • 0+',
                style: theme.textTheme.headline2!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500),
              ),
              const SizedBox(height: 10),
              Text(
                'Балет • Ёлки • Детям',
                style: theme.textTheme.headline2!.copyWith(
                    color: Colors.black,
                    fontSize: 16,
                    fontWeight: FontWeight.w400),
              ),
              const SizedBox(height: 10),
              DurationEventWidget(theme: theme),
              const SizedBox(height: 15),
              PriceEventWidget(theme: theme),
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
              DescriptionEventWidget(
                theme: theme,
                isFullTextShowed: isFullTextShowed,
              ),
              const SizedBox(height: 10),
              ShowDescriptionEventWidget(
                theme: theme,
                isFullTextShowed: isFullTextShowed,
              ),
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
                'КЗ СОГУ, ул. Бутырина, 37 • 95 м',
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
              ContactEventWidget(theme: theme),
              const SizedBox(height: 10),
              UrlEventWidget(theme: theme),
              const SizedBox(height: 30),
              const NameRowHeader(
                name: 'Отзывы',
              ),
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
              const NameRowHeaderEvents(name: 'Также рекомендуем'),
              const SizedBox(height: 15),
            ],
          ),
        )
      ],
    );
  }
}
