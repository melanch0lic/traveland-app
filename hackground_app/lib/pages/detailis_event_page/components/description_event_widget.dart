import 'package:flutter/material.dart';

class DescriptionEventWidget extends StatelessWidget {
  const DescriptionEventWidget({
    Key? key,
    required this.theme,
    required this.isFullTextShowed,
  }) : super(key: key);

  final ThemeData theme;
  final bool isFullTextShowed;

  @override
  Widget build(BuildContext context) {
    return AnimatedCrossFade(
        firstChild: Text(
          '«Щелкунчик» — самая знаменитая сказка балетной сцены. Самое волшебное и новогоднее произведение Чайковского, известное по всему миру. Это рождественская сказка о благородном и прекрасном заколдованном принце...',
          style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
        secondChild: Text(
          'Легендарный спектакль "Щелкунчик" в версии "Классического Русского балета" - это яркий, неповторимый балет-феерия,в классической постановке, обрамленная великолепными декорациями и костюмами.',
          style: theme.textTheme.bodyText1!.copyWith(
              color: theme.primaryColorDark, fontWeight: FontWeight.w400),
        ),
        crossFadeState: isFullTextShowed
            ? CrossFadeState.showSecond
            : CrossFadeState.showFirst,
        duration: const Duration(milliseconds: 400));
  }
}
