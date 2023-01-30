import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class DurationEventWidget extends StatelessWidget {
  const DurationEventWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
