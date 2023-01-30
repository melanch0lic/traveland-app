import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/foundation/key.dart';
import 'package:flutter/src/widgets/container.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter_svg/svg.dart';
import 'package:flutter_switch/flutter_switch.dart';
import 'package:hackground_app/pages/application_settings_page/components/body_application_settings.dart';

import 'components/auto_load_row_widget.dart';
import 'components/notify_row_widget.dart';

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
          style: theme.textTheme.headline2!.copyWith(
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
