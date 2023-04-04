import 'package:flutter/material.dart';

import 'auto_load_row_widget.dart';
import 'notify_row_widget.dart';

class BodyApplicationSettings extends StatelessWidget {
  const BodyApplicationSettings({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        const SizedBox(height: 30),
        NotifyRowWidget(theme: theme),
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Divider(
            color: Color.fromRGBO(142, 142, 147, 1),
          ),
        ),
        AutoLoadRowWidget(theme: theme),
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Divider(
            color: Color.fromRGBO(142, 142, 147, 1),
          ),
        ),
      ],
    );
  }
}
