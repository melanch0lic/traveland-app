import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';

import '../../../navigation/router.gr.dart';

class StartRegistrationButton extends StatelessWidget {
  const StartRegistrationButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(37, 65, 178, 1),
          foregroundColor: const Color.fromRGBO(30, 53, 144, 1),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: () {
          context.router.push(const RegisterRouter());
        },
        child: Center(
            child: Text(
          tr('sign_up'),
          style: Theme.of(context).textTheme.bodyLarge,
        )),
      ),
    );
  }
}
