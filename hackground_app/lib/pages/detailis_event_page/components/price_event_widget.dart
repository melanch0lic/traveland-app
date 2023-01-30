import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class PriceEventWidget extends StatelessWidget {
  const PriceEventWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(children: [
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
            TextSpan(
                text: '1500 ₽', style: TextStyle(fontWeight: FontWeight.bold)),
            TextSpan(text: ' за билет'),
          ],
        ),
      )
    ]);
  }
}
