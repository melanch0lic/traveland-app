import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import 'package:url_launcher/url_launcher.dart';

import '../../app_localizations.dart';
import '../../data/network/models/entity/housing_entity.dart';
import '../../domain/models/attraction_model.dart';
import '../../dummy_data.dart';
import '../../widgets/actions_icons_appbar_widget.dart';
import '../../widgets/image_slider.dart';
import '../../widgets/name_row_header.dart';
import 'components/contact_item.dart';
import 'components/review_card.dart';
import 'components/sent_review_button.dart';
import 'details_page_model.dart';

class DetailsPage extends StatelessWidget {
  final HousingEntity selectedModel;
  const DetailsPage({Key? key, required this.selectedModel}) : super(key: key);

  Future<void> openPhoneNumber(BuildContext context, String phoneNumber) async {
    final String phoneAppUrl = 'tel://$phoneNumber';
    final Uri phoneAppUrlRequest = Uri.parse(phoneAppUrl);

    try {
      await launchUrl(phoneAppUrlRequest);
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Phone Error')));
    }
  }

  Future<void> openWebsite(BuildContext context, String websiteUrl) async {
    final Uri websiteAppUrlRequest = Uri.parse(websiteUrl);

    try {
      await launchUrl(websiteAppUrlRequest);
    } catch (error) {
      ScaffoldMessenger.of(context)
          .showSnackBar(const SnackBar(content: Text('Website Error')));
    }
  }

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
              title: Expanded(
                child: Text(
                  selectedModel.placeInfo.name,
                  style: theme.textTheme.headline2!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              actions: const [
                ActionsIconsAppBarWidget(),
              ],
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
                  padding: const EdgeInsets.all(15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        children: [
                          ...List.generate(
                              5,
                              (index) => buildStar(context, index,
                                  selectedModel.placeInfo.meanRating.value))
                        ],
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      Text(
                        '${selectedModel.placeInfo.name}',
                        style: theme.textTheme.headline2!.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
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
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: theme.primaryColorDark,
                                fontWeight: FontWeight.w400),
                          )
                        ],
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      if (selectedModel.price != null)
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
                              style: theme.textTheme.bodyText1!.copyWith(
                                  color: theme.primaryColorDark,
                                  fontWeight: FontWeight.w400),
                            )
                          ],
                        ),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        translate(context, 'description_text'),
                        style: theme.textTheme.headline2!.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      AnimatedCrossFade(
                          firstChild: Text(
                            '${selectedModel.placeInfo.description}',
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: theme.primaryColorDark,
                                fontWeight: FontWeight.w400),
                          ),
                          secondChild: Text(
                            '${selectedModel.placeInfo.description}',
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: theme.primaryColorDark,
                                fontWeight: FontWeight.w400),
                          ),
                          crossFadeState: isFullTextShowed
                              ? CrossFadeState.showSecond
                              : CrossFadeState.showFirst,
                          duration: const Duration(milliseconds: 400)),
                      const SizedBox(
                        height: 10,
                      ),
                      InkWell(
                          onTap: () {
                            context
                                .read<DetailsPageViewModel>()
                                .onShowFullButtonPressed();
                          },
                          splashColor: Colors.black,
                          highlightColor: theme.indicatorColor.withOpacity(0.5),
                          child: Text(
                            isFullTextShowed
                                ? translate(context, 'hide_text')
                                : translate(context, 'show_full_text'),
                            style: theme.textTheme.bodyText2!
                                .copyWith(color: theme.indicatorColor),
                          )),
                      const SizedBox(
                        height: 30,
                      ),
                      Text(
                        translate(context, 'location_text'),
                        style: theme.textTheme.headline2!.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),
                      Text(
                        '${selectedModel.placeInfo.adress} • ${selectedModel.placeInfo.latitude.value} ${selectedModel.placeInfo.longitude.value}',
                        style: theme.textTheme.bodyText1!.copyWith(
                            color: theme.primaryColorDark,
                            fontWeight: FontWeight.w400),
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

                      Text(
                        translate(context, 'contacts_text'),
                        style: theme.textTheme.headline2!.copyWith(
                            color: Colors.black,
                            fontSize: 20,
                            fontWeight: FontWeight.w500),
                      ),
                      const SizedBox(
                        height: 15,
                      ),

                      ContactItem(
                        iconPath: 'assets/images/phone_icon.svg',
                        text: selectedModel.placeInfo.number.value,
                        callback: () => openPhoneNumber(
                            context, selectedModel.placeInfo.number.value),
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      ContactItem(
                        iconPath: 'assets/images/email_icon.svg',
                        text: selectedModel.placeInfo.mail.value,
                        callback: () async {
                          await Clipboard.setData(ClipboardData(
                              text: selectedModel.placeInfo.mail.value));
                        },
                      ),
                      const SizedBox(
                        height: 10,
                      ),

                      ContactItem(
                          iconPath: 'assets/images/browser_icon.svg',
                          text: selectedModel.placeInfo.url.value,
                          callback: () => openWebsite(
                              context, selectedModel.placeInfo.url.value)),
                      const SizedBox(
                        height: 30,
                      ),
                      NameRowHeader(
                        name: translate(context, 'reviews_text'),
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
                              padding: const EdgeInsets.symmetric(
                                  vertical: 5, horizontal: 10.5),
                              child: Text(
                                '${selectedModel.placeInfo.meanRating.value}',
                                style: Theme.of(context)
                                    .textTheme
                                    .bodyText2
                                    ?.copyWith(
                                      color: const Color.fromRGBO(
                                          255, 255, 255, 1),
                                      fontSize: 14,
                                    ),
                              ),
                            ),
                          ),
                          const SizedBox(
                            width: 5,
                          ),
                          Text(
                            '${selectedModel.placeInfo.ratingCount.value} отзывов',
                            style: theme.textTheme.bodyText1!.copyWith(
                                color: theme.primaryColorDark,
                                fontWeight: FontWeight.w400),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
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
                      NameRowHeader(
                          name: translate(context, 'also_recommended')),
                      const SizedBox(
                        height: 15,
                      ),
                      // EventSmallListView(attractionListHouse.sublist(1)),
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
