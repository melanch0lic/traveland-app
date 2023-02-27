import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/svg.dart';

class ContactEmailWidget extends StatelessWidget {
  final String text;
  const ContactEmailWidget({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return InkWell(
      onTap: () async {
        await Clipboard.setData(ClipboardData(text: text));
      },
      child: Row(
        children: [
          SvgPicture.asset(
            'assets/images/email_icon.svg',
            width: 16,
            height: 16,
            color: theme.primaryColorDark,
          ),
          const SizedBox(
            width: 10,
          ),
          Text(
            text,
            style: theme.textTheme.bodyLarge!.copyWith(color: theme.primaryColorDark, fontWeight: FontWeight.w400),
          )
        ],
      ),
    );
  }
}
