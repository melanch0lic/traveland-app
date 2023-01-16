import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class ContactExursionWidget extends StatelessWidget {
  const ContactExursionWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}
