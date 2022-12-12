import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/start_auth_button.dart';
import 'components/start_reg_button.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SvgPicture.asset('assets/images/logo.svg'),
            ),
            Column(
              children: const [StartRegistrationButton(), SizedBox(height: 15), StartAuthButton()],
            )
          ],
        ),
      )),
    );
  }
}
