import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:intl/intl.dart';
import 'package:provider/provider.dart';

import '../../../data/network/models/entity/place_entity.dart';
import '../detailis_location_model_page.dart';

class TimeLocationWidget extends StatelessWidget {
  final PlaceEntity selectedModel;

  const TimeLocationWidget({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final sheduleList = selectedModel.shedule;
    final deviceHeight = MediaQuery.of(context).size.height;
    final isSheduleOpened = context.select((DetailsLocationPageViewModel model) => model.isSheduleOpened);
    const List<String> weekdays = ['Понедельник', 'Вторник', 'Среда', 'Четверг', 'Пятница', 'Суббота', 'Воскресенье'];
    return sheduleList.isNotEmpty
        ? AnimatedCrossFade(
            firstChild: Container(
              height: deviceHeight * 0.09,
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/time.svg',
                        color: theme.primaryColorDark,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Время работы',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color.fromRGBO(44, 44, 46, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(sheduleList
                              .firstWhere((element) => DateTime.now().weekday == int.parse(element.weekDay))
                              .startWork
                              .isValid
                          ? 'Открыто до ${DateFormat('HH:mm', 'ru').format(DateTime.parse(sheduleList.firstWhere((element) => DateTime.now().weekday == int.parse(element.weekDay)).endWork.value))}'
                          : 'Не указано'),
                      const Spacer(),
                      InkWell(
                        onTap: context.read<DetailsLocationPageViewModel>().onShedulePressed,
                        child: Row(
                          children: const [Text('График'), Icon(Icons.expand_more)],
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            secondChild: Container(
              padding: const EdgeInsets.symmetric(vertical: 10),
              height: deviceHeight * 0.5,
              child: Column(
                children: [
                  Row(
                    children: [
                      SvgPicture.asset(
                        'assets/images/time.svg',
                        color: theme.primaryColorDark,
                      ),
                      const SizedBox(width: 5),
                      Text(
                        'Время работы',
                        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                              color: const Color.fromRGBO(44, 44, 46, 1),
                              fontSize: 16,
                              fontWeight: FontWeight.w600,
                            ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 5),
                  Row(
                    children: [
                      Text(sheduleList
                              .firstWhere((element) => DateTime.now().weekday == int.parse(element.weekDay))
                              .startWork
                              .isValid
                          ? 'Открыто до ${DateFormat('HH:mm', 'ru').format(DateTime.parse(sheduleList.firstWhere((element) => DateTime.now().weekday == int.parse(element.weekDay)).endWork.value))}'
                          : 'Не указано'),
                      const Spacer(),
                      InkWell(
                        onTap: context.read<DetailsLocationPageViewModel>().onShedulePressed,
                        child: Row(
                          children: const [Text('График'), Icon(Icons.expand_less)],
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 5),
                  Expanded(
                    child: ListView.builder(
                      physics: const NeverScrollableScrollPhysics(),
                      itemBuilder: (context, index) => ListTile(
                        title: Text(weekdays[int.parse(sheduleList[index].weekDay) - 1],
                            style: theme.textTheme.bodyMedium!.copyWith(fontSize: 16)),
                        trailing: sheduleList[index].startWork.isValid
                            ? Text(
                                '${DateFormat('HH:mm', 'ru').format(DateTime.parse(sheduleList[index].startWork.value))} - ${DateFormat('HH:mm', 'ru').format(DateTime.parse(sheduleList[index].endWork.value))}')
                            : const Text('Не указано'),
                      ),
                      itemCount: sheduleList.length,
                    ),
                  )
                ],
              ),
            ),
            crossFadeState: isSheduleOpened ? CrossFadeState.showSecond : CrossFadeState.showFirst,
            duration: const Duration(milliseconds: 200),
          )
        : Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    SvgPicture.asset(
                      'assets/images/time.svg',
                      color: theme.primaryColorDark,
                    ),
                    const SizedBox(width: 5),
                    Text(
                      'Время работы',
                      style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                            color: const Color.fromRGBO(44, 44, 46, 1),
                            fontSize: 16,
                            fontWeight: FontWeight.w600,
                          ),
                    ),
                  ],
                ),
                const SizedBox(height: 5),
                const Text('Не указано')
              ],
            ),
          );
  }
}
