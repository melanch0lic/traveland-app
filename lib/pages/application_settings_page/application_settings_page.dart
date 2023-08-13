import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/body_application_settings.dart';

class ApplicationSettingsPage extends StatelessWidget {
  const ApplicationSettingsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
          highlightColor: theme.cardColor,
          splashRadius: 15,
          icon: SvgPicture.asset(
            'assets/images/back_arrow_icon.svg',
            color: Colors.black,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        title: Text(
          'Настройки приложения',
          style: theme.textTheme.displayMedium!.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: theme.primaryColorLight,
      ),
      body: BodyApplicationSettings(theme: theme),
    );
  }
}
