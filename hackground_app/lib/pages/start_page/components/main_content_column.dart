import 'package:flutter/material.dart';
import 'package:hackground_app/pages/start_page/components/start_auth_button.dart';
import 'package:hackground_app/pages/start_page/components/start_guest_button.dart';
import 'package:hackground_app/pages/start_page/components/start_reg_button.dart';

import 'or_divider_widget.dart';

class MainContentColumn extends StatelessWidget {
  const MainContentColumn({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: const [
        StartRegistrationButton(),
        SizedBox(height: 15),
        StartAuthButton(),
        SizedBox(height: 100),
        OrDividerWidget(),
        SizedBox(height: 15),
        StartGuestButton(),
      ],
    );
  }
}
