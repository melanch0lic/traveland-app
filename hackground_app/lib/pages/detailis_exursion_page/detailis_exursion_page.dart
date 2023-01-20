import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../app_localizations.dart';
import '../../data/network/models/entity/tour_entity.dart';
import '../../dummy_data.dart';
import '../../widgets/excursion_small_listview.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/name_row_header.dart';
import '../details_page/components/review_card.dart';
import '../details_page/components/sent_review_button.dart';
import 'components/contact_exursion_widget.dart';
import 'components/info_guide_widget.dart';
import 'components/review_exursion_widget.dart';
import 'components/route_map.dart';
import 'detailis_exursion_page_model.dart';

class DetailisExursionPage extends StatelessWidget {
  final TourEntity selectedModel;
  const DetailisExursionPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
        create: (context) => DetailsExursionPageViewModel(context.read<InitializeProvider>().cachedDataRepository),
        child: Builder(builder: (context) {
          final isFullTextShowed = context.select(
            (DetailsExursionPageViewModel model) => model.isFullTextShowed,
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
                  urlImages: selectedModel.photos.map((e) => e.mediumAvatarUrl).toList(),
                ),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        selectedModel.title,
                        style: theme.textTheme.headline2!
                            .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(height: 10),
                      Container(
                        padding: const EdgeInsets.only(left: 19.5, right: 19.5),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(7),
                          color: const Color.fromRGBO(56, 176, 0, 1),
                        ),
                        child: Text('Низкая сложность',
                            style: Theme.of(context).textTheme.bodyText1?.copyWith(
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                )),
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
                            selectedModel.duration != null
                                ? '${selectedModel.duration!.toInt()} часов • ${selectedModel.movementType == 'car' ? 'На машине' : selectedModel.movementType == 'foot' ? 'Пешком' : 'На автобусе'}'
                                : 'Время не указано',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  color: const Color.fromRGBO(44, 44, 46, 1),
                                  fontSize: 14,
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                          const SizedBox(width: 15),
                        ],
                      ),
                      const SizedBox(height: 15),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/wallet_icon.svg',
                            color: theme.primaryColorDark,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '${selectedModel.price.value.toInt()} ₽',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontSize: 16,
                                  color: const Color.fromRGBO(44, 44, 46, 1),
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          Text(
                            ' на ${selectedModel.maxPersons} человек',
                            style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                  fontSize: 16,
                                  color: const Color.fromRGBO(44, 44, 46, 1),
                                  fontWeight: FontWeight.w400,
                                ),
                          ),
                        ],
                      ),
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
                            '${selectedModel.annotation.substring(0, selectedModel.annotation.length ~/ 2)}...',
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                          ),
                          secondChild: Text(
                            selectedModel.annotation,
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                          ),
                          crossFadeState: isFullTextShowed ? CrossFadeState.showSecond : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 400)),
                      InkWell(
                          onTap: () {
                            context.read<DetailsExursionPageViewModel>().onShowFullButtonPressed();
                          },
                          splashColor: Colors.black,
                          highlightColor: theme.indicatorColor.withOpacity(0.5),
                          child: Text(
                            isFullTextShowed ? translate(context, 'hide_text') : translate(context, 'show_full_text'),
                            style: theme.textTheme.bodyText2!.copyWith(color: theme.indicatorColor),
                          )),
                      const SizedBox(height: 30),
                      Text(
                        'Маршрут',
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: 20,
                              color: const Color.fromRGBO(44, 44, 46, 1),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 15),
                      const RouteMap(),
                      const SizedBox(height: 30),
                      Text(
                        'Экскурсовод',
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: 20,
                              color: const Color.fromRGBO(44, 44, 46, 1),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 15),
                      InfoGuideWidget(selectedModel: selectedModel),
                      const SizedBox(height: 30),
                      Text(
                        'Контакты',
                        style: Theme.of(context).textTheme.headline1?.copyWith(
                              fontSize: 20,
                              color: const Color.fromRGBO(44, 44, 46, 1),
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                      const SizedBox(height: 16),
                      ContactExursionWidget(theme: theme),
                      const SizedBox(height: 30),
                      const NameRowHeader(
                        name: 'Отзывы',
                      ),
                      ReviewExursionWidget(selectedModel: selectedModel, theme: theme),
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
                      ExcursionSmallListView(
                        excursions: context
                            .read<DetailsExursionPageViewModel>()
                            .excursions
                            .where((element) => element.id != selectedModel.id)
                            .toList(),
                      )
                      // ExcursionSmallListView(excursions: excursions),
                    ],
                  ),
                ),
              ],
            ),
          );
        }));
  }
}
