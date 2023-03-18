import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import 'components/register_button.dart';
import 'components/register_emai_texfield.dart';
import 'components/register_password_textfield.dart';
import 'components/retry_password_textfield.dart';
import 'register_page_model.dart';

class RegisterPage extends StatelessWidget {
  const RegisterPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => RegisterPageViewModel(),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            highlightColor: theme.cardColor,
            splashRadius: 15,
            icon: SvgPicture.asset(
              'assets/images/back_arrow_icon.svg',
              color: Colors.black,
            ),
            onPressed: () => context.router.pop(),
          ),
          title: Container(
            padding: const EdgeInsets.only(right: 10),
            child: Text(tr('reg_text'),
                style: theme.textTheme.displayMedium!
                    .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
          ),
          backgroundColor: theme.bottomAppBarTheme.color,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              RegisterEmailTextField(),
              SizedBox(height: 20),
              RegisterPasswordTextfield(),
              SizedBox(height: 20),
              RetryPasswordTextfield(),
              SizedBox(height: 50),
              RegisterButton()
            ],
          ),
        ),
      ),
    );
  }
}
