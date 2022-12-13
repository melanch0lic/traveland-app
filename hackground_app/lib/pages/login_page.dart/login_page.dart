import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'components/auth_button.dart';
import 'components/email_textfield.dart';
import 'components/password_textfield.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

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
        title: Text('Вход', style: theme.textTheme.headline2!.copyWith(color: Colors.black)),
        backgroundColor: theme.bottomAppBarColor,
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: const [
            EmailTextField(),
            SizedBox(height: 20),
            PasswordTextfield(),
            SizedBox(height: 50),
            AuthButton(),
          ],
        ),
      ),
    );
  }
}
