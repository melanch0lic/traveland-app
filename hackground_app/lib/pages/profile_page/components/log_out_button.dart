import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../navigation/router.gr.dart';
import '../profile_page_model.dart';

class LogOutButton extends StatelessWidget {
  const LogOutButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color.fromRGBO(37, 65, 178, 0.2),
          side: const BorderSide(color: Color.fromRGBO(37, 65, 178, 1)),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: () {
          context
              .read<ProfilePageViewModel>()
              .onButtonExitPressed()
              .whenComplete(() => context.router.replace(const LoginRouter()));
        },
        child: Center(
          child: Text(
            'Выйти',
            style: theme.textTheme.bodyLarge!.copyWith(color: theme.indicatorColor),
          ),
        ),
      ),
    );
  }
}
