import 'package:flutter/material.dart';
import 'package:hackground_app/pages/application_settings_page/components/auto_load_row_widget.dart';
import 'package:hackground_app/pages/application_settings_page/components/notify_row_widget.dart';

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
        SizedBox(height: 30),
        NotifyRowWidget(theme: theme),
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15, bottom: 15),
          child: Divider(),
        ),
        AutoLoadRowWidget(theme: theme),
        const Padding(
          padding: EdgeInsets.only(left: 15, right: 15),
          child: Divider(),
        ),
      ],
    );
  }
}
