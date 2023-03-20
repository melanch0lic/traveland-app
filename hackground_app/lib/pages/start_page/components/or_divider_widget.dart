import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

class OrDividerWidget extends StatelessWidget {
  const OrDividerWidget({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(children: [
      const Expanded(
          child: Divider(
        color: Color.fromRGBO(44, 44, 46, 1),
      )),
      const SizedBox(width: 10),
      Text(
        tr('or_text'),
        style: Theme.of(context).textTheme.bodyMedium?.copyWith(
              fontSize: 14,
              color: const Color.fromRGBO(44, 44, 46, 1),
              fontWeight: FontWeight.w400,
            ),
      ),
      const SizedBox(width: 10),
      const Expanded(
          child: Divider(
        color: Color.fromRGBO(44, 44, 46, 1),
      )),
    ]);
  }
}
