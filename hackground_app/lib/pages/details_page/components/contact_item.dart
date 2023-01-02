import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

class ContactItem extends StatelessWidget {
  const ContactItem({Key? key, required this.iconPath, required this.text, required this.callback}) : super(key: key);
  final String iconPath;
  final String text;
  final Function callback;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () => callback(),
      child: Row(
        children: [
          SvgPicture.asset(
            iconPath,
            width: 16,
            height: 16,
            color: theme.primaryColorDark,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: theme.textTheme.bodyText1!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
