import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class UrlEventWidget extends StatelessWidget {
  const UrlEventWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
