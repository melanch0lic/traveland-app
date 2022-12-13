import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../login_page.dart/components/email_textfield.dart';
import '../login_page.dart/components/password_textfield.dart';
import 'components/register_button.dart';
import 'components/retry_password_textfield.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

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
        title: Text('Регистрация', style: theme.textTheme.headline2!.copyWith(color: Colors.black)),
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
            SizedBox(height: 20),
            RetryPasswordTextfield(),
            SizedBox(height: 50),
            RegisterButton()
          ],
        ),
      ),
    );
  }
}
