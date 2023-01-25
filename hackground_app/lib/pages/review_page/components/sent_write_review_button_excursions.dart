import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../app_localizations.dart';
import '../../../navigation/router.gr.dart';

class SentWriteReviewButtonExcursions extends StatelessWidget {
  const SentWriteReviewButtonExcursions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Color.fromRGBO(37, 65, 178, 1),
          foregroundColor: const Color.fromRGBO(37, 65, 178, 0.2),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: () {},
        child: Center(
          child: Text(
            'Оставить отзыв',
            style: theme.textTheme.bodyText1!.copyWith(
                color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
