import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class TimeLocationWidget extends StatelessWidget {
  const TimeLocationWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/time.svg',
          color: theme.primaryColorDark,
        ),
        const SizedBox(width: 5),
        Text(
          'Пн–Пт 10:00–20:00',
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        ),
      ],
    );
  }
}
