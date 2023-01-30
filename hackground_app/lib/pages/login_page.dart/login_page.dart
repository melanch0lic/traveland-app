import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import 'components/auth_button.dart';
import 'components/auth_settings_widget.dart';
import 'components/email_textfield.dart';
import 'components/password_textfield.dart';
import 'login_page_model.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => LoginPageViewModel(authService: context.read<InitializeProvider>().authService),
      child: Builder(builder: (context) {
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
            title: Text('Вход',
                style: theme.textTheme.headline2!
                    .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
            backgroundColor: theme.bottomAppBarColor,
          ),
          body: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Text(
                  context.select((LoginPageViewModel model) => model.authErrorTitle),
                  style: theme.textTheme.bodyText1!.copyWith(color: Colors.black),
                ),
                const SizedBox(height: 5),
                const EmailTextField(),
                const SizedBox(height: 20),
                const PasswordTextfield(),
                const SizedBox(height: 50),
                const AuthSettingsWidget(),
                const AuthButton(),
              ],
            ),
          ),
        );
      }),
    );
  }
}
