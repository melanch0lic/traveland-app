import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../navigation/router.gr.dart';

class StartAuthButton extends StatelessWidget {
  const StartAuthButton({Key? key}) : super(key: key);

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
          context.router.push(const LoginRoute());
        },
        child: Center(
          child: Text(
            tr('sign_in'),
            style: theme.textTheme.bodyLarge!.copyWith(color: theme.indicatorColor),
          ),
        ),
      ),
    );
  }
}
