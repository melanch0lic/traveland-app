import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import 'about_info_page_model.dart';
import 'components/name_textfield.dart';
import 'components/sent_info_button.dart';
import 'components/sex_dropdown.dart';
import 'components/surname_textfield.dart';

class AboutInfoPage extends StatelessWidget {
  const AboutInfoPage({Key? key, required this.email, required this.password}) : super(key: key);

  final String email;
  final String password;

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) => AboutInfoPageViewModel(
          authService: context.read<InitializeProvider>().authService, email: email, password: password),
      child: Scaffold(
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
          title: Container(
            padding: const EdgeInsets.only(right: 10),
            child: Text('О себе',
                style: theme.textTheme.headline2!
                    .copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500)),
          ),
          backgroundColor: theme.bottomAppBarColor,
        ),
        body: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: const [
              NameTextField(),
              SizedBox(height: 20),
              SurnameTextField(),
              SizedBox(height: 20),
              SexDropDown(),
              SizedBox(height: 50),
              SentInfoButton()
            ],
          ),
        ),
      ),
    );
  }
}
