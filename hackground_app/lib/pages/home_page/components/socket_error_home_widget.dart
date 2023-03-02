import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';

import '../../../navigation/router.gr.dart';

class SocketErrorHomeWidget extends StatelessWidget {
  const SocketErrorHomeWidget({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: ElevatedButton(
        onPressed: () {
          context.router.replace(const HomeRouter());
        },
        style: ElevatedButton.styleFrom(
          backgroundColor: theme.scaffoldBackgroundColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(26.0),
            side: BorderSide(color: theme.indicatorColor.withOpacity(0.2)),
          ),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              const Icon(Icons.replay),
              Text(
                'Обновить'.toUpperCase(),
                style: theme.textTheme.bodyMedium!.copyWith(fontSize: 11, color: theme.indicatorColor.withOpacity(0.5)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
