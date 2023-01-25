import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../app_localizations.dart';
import '../../data/network/models/entity/event_entity.dart';
import '../../dummy_data.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/name_row_header.dart';
import '../detailis_exursion_page/components/route_map.dart';
import '../details_page/components/review_card.dart';
import '../details_page/components/sent_review_button.dart';
import 'components/review_event_widget.dart';
import 'detailis_event_page_model.dart';

class DetailisEventPage extends StatelessWidget {
  final EventsEntity selectedModel;
  const DetailisEventPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
        create: (context) => DetailsEventPageViewModel(),
        child: Builder(builder: (context) {
          final isFullTextShowed = context.select(
            (DetailsEventPageViewModel model) => model.isFullTextShowed,
          );
          return Scaffold(
            appBar: AppBar(
              leading: IconButton(
                highlightColor: theme.cardColor,
                splashRadius: 15,
                icon: SvgPicture.asset(
                  'assets/images/back_arrow_icon.svg',
                  color: Colors.black,
                ),
                onPressed: () => Navigator.of(context).pop(),
              ),
              title: Text(
                'Подробная информация',
                style:
                    theme.textTheme.headline2!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              backgroundColor: theme.primaryColorLight,
            ),
            body: ListView(
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
                        style: theme.textTheme.headline2!
                            .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 11),
                      Text(
                        'Балет • Ёлки • Детям',
                        style: theme.textTheme.headline2!
                            .copyWith(color: Colors.black, fontSize: 16, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/duration.svg',
                            color: theme.primaryColorDark,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '2 часа',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: const Color.fromRGBO(44, 44, 46, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(children: [
                        SvgPicture.asset(
                          'assets/images/wallet_icon.svg',
                          color: theme.primaryColorDark,
                        ),
                        const SizedBox(width: 5),
                        RichText(
                          text: TextSpan(
                            text: 'от ',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: const Color.fromRGBO(44, 44, 46, 1),
                                  fontSize: 16,
                                  fontWeight: FontWeight.w400,
                                ),
                            children: const <TextSpan>[
                              TextSpan(text: '1500 ₽', style: TextStyle(fontWeight: FontWeight.bold)),
                              TextSpan(text: ' за билет'),
                            ],
                          ),
                        )
                      ]),
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
                      AnimatedCrossFade(
                          firstChild: Text(
                            '«Щелкунчик» — самая знаменитая сказка балетной сцены. Самое волшебное и новогоднее произведение Чайковского, известное по всему миру. Это рождественская сказка о благородном и прекрасном заколдованном принце...',
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                          ),
                          secondChild: Text(
                            'Легендарный спектакль "Щелкунчик" в версии "Классического Русского балета" - это яркий, неповторимый балет-феерия,в классической постановке, обрамленная великолепными декорациями и костюмами.',
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                          ),
                          crossFadeState: isFullTextShowed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 400)),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            context.read<DetailsEventPageViewModel>().onShowFullButtonPressed();
                          },
                          splashColor: Colors.black,
                          highlightColor: theme.indicatorColor.withOpacity(0.5),
                          child: Text(
                            isFullTextShowed ? translate(context, 'hide_text') : translate(context, 'show_full_text'),
                            style: theme.textTheme.bodyText2!.copyWith(color: theme.indicatorColor),
                          )),
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
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/phone_icon.svg',
                            color: theme.primaryColorDark,
                          ),
                          const SizedBox(width: 6.74),
                          Text(
                            '8 (867) 240-40-70',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontSize: 16,
                                  color: const Color.fromRGBO(44, 44, 46, 1),
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 10),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/browser_icon.svg',
                            color: theme.primaryColorDark,
                          ),
                          const SizedBox(width: 6.74),
                          Text(
                            'https://www.rus-ballet.ru/',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontSize: 16,
                                  color: const Color.fromRGBO(44, 44, 46, 1),
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 30),
                      const NameRowHeader(
                        name: 'Отзывы',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
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
                      const SizedBox(
                        height: 15,
                      ),
                      const SentReviewButton(),
                      const SizedBox(
                        height: 30,
                      ),
                      const NameRowHeader(name: 'Также рекомендуем'),
                      const SizedBox(
                        height: 15,
                      ),
                      // EventSmallListView(attractionListEvents.sublist(1)),
                    ],
                  ),
                )
              ],
            ),
          );
        }));
  }
}
