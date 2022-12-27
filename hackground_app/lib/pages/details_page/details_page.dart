import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../domain/models/attraction_model.dart';
import '../../dummy_data.dart';
import '../../widgets/name_row_header.dart';
import 'components/image_slider.dart';
import 'components/review_card.dart';
import 'details_page_model.dart';

class DetailsPage extends StatelessWidget {
  final Attraction selectedModel;
  const DetailsPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => DetailsPageViewModel(),
      child: Builder(builder: (context) {
        final isFullTextShowed = context.select(
          (DetailsPageViewModel model) => model.isFullTextShowed,
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
                '${selectedModel.name}',
                style:
                    theme.textTheme.headline2!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
              ),
              backgroundColor: theme.primaryColorLight,
            ),
            body: ListView(
              children: [
                const ImageSlider(),
                Padding(
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ...List.generate(5, (index) => buildStar(context, index, selectedModel.starRating!))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${selectedModel.name}',
                        style: theme.textTheme.headline2!
                            .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/location_icon.svg',
                            color: theme.primaryColorDark,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '700м до центра',
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        'Wi-Fi • Парковка • Кондиционер в номере • Оплата картой',
                        style: theme.textTheme.bodyText1!
                            .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          SvgPicture.asset(
                            'assets/images/wallet_icon.svg',
                            color: theme.primaryColorDark,
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            'от ${selectedModel.price} ₽ за ночь',
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Описание',
                        style: theme.textTheme.headline2!
                            .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AnimatedCrossFade(
                          firstChild: Text(
                            '«Александровский» - первый 4-звездочный отель мирового уровня, расположенный в самом центре Владикавказа, столицы Северной Осетии. Пребывание в отеле позволит Вам окунуться в атмосферу элегантной роскоши и величия императорской эпохи...',
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                          ),
                          secondChild: Text(
                            '«Александровский» - первый 4-звездочный отель мирового уровня, расположенный в самом центре Владикавказа, столицы Северной Осетии. Пребывание в отеле позволит Вам окунуться в атмосферу элегантной роскоши и величия императорской эпохи. Отель находится на проспекте Мира, который ранее именовался Александровским в честь императора Александра II. Гранд-отель «Александровский» бережно хранит традиции тех легендарных времен. Каждая деталь отеля – от приветствия швейцара до панорамных видов на горные вершины - соответствует высоким запросам наших гостей. ',
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
                            context.read<DetailsPageViewModel>().onShowFullButtonPressed();
                          },
                          splashColor: Colors.black,
                          highlightColor: theme.indicatorColor.withOpacity(0.5),
                          child: Text(
                            isFullTextShowed ? 'Скрыть' : 'Показать полностью...',
                            style: theme.textTheme.bodyText2!.copyWith(color: theme.indicatorColor),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        'Местоположение',
                        style: theme.textTheme.headline2!
                            .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${selectedModel.address} • ${selectedModel.distance} ${selectedModel.distType}',
                        style: theme.textTheme.bodyText1!
                            .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Container(
                          height: 200,
                          decoration: const BoxDecoration(
                            borderRadius: BorderRadius.all(Radius.circular(15)),
                            image: DecorationImage(
                                image: AssetImage(
                                  'assets/images/map_alex.png',
                                ),
                                fit: BoxFit.cover),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      const NameRowHeader(
                        name: 'Отзывы',
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Row(
                        children: [
                          Container(
                            width: 42,
                            height: 27,
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(7),
                              color: const Color.fromRGBO(56, 176, 0, 1),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 10.5),
                              child: Text(
                                '${selectedModel.starRating}',
                                style: Theme.of(context).textTheme.bodyText2?.copyWith(
                                      color: const Color.fromRGBO(255, 255, 255, 1),
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${selectedModel.reviewCount} отзывов',
                            style: theme.textTheme.bodyText1!
                                .copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      ReviewCard(
                        review: reviewList[0],
                      ),
                    ],
                  ),
                ),
              ],
            ));
      }),
    );
  }

  Widget buildStar(BuildContext context, int index, double rating) {
    Icon icon;
    if (index >= rating) {
      icon = const Icon(
        Icons.star_border,
        color: Color.fromRGBO(253, 197, 0, 1),
      );
    } else if (index > rating - 1 && index < rating) {
      icon = const Icon(Icons.star_half, color: Color.fromRGBO(253, 197, 0, 1));
    } else {
      icon = const Icon(Icons.star, color: Color.fromRGBO(253, 197, 0, 1));
    }
    return icon;
  }
}
