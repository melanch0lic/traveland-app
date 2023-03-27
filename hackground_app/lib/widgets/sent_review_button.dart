import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../app_initialization.dart';
import '../navigation/router.gr.dart';

class SentReviewButton extends StatelessWidget {
  final int placeId;
  const SentReviewButton({Key? key, required this.placeId}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isGuestMode = context.select((InitializeProvider model) => model.isGuestMode);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: Colors.transparent,
          foregroundColor: const Color.fromRGBO(37, 65, 178, 0.2),
          side: const BorderSide(color: Color.fromRGBO(37, 65, 178, 1), width: 2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: isGuestMode
            ? () => showDialog(
                context: context,
                builder: (_) => AlertDialog(
                      title: Center(
                        child: Text(
                          'Чтобы оставить отзыв, необходимо зарегистрироваться!',
                          style: theme.textTheme.bodyMedium!.copyWith(fontWeight: FontWeight.w500),
                        ),
                      ),
                    ))
            : () => context.router.navigate(WriteReviewRoute(placeId: placeId)),
        child: Center(
          child: Text(
            'Оставить отзыв',
            style: theme.textTheme.bodyLarge!.copyWith(color: theme.indicatorColor),
          ),
        ),
      ),
    );
  }
}
