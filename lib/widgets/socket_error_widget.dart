
import 'package:flutter/material.dart';

class SocketErrorWidget extends StatelessWidget {
  final Function callback;
  const SocketErrorWidget({Key? key, required this.callback}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            'Произошла ошибка сети',
            style: theme.textTheme.bodyMedium!.copyWith(color: theme.indicatorColor),
          ),
          ElevatedButton(
            onPressed: () {
              callback();
            },
            style: ElevatedButton.styleFrom(
              backgroundColor: theme.scaffoldBackgroundColor,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(26.0),
                side: BorderSide(color: theme.indicatorColor.withOpacity(0.5)),
              ),
            ),
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Row(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Icon(
                    Icons.replay,
                    color: theme.cardColor,
                  ),
                  Text(
                    'Обновить'.toUpperCase(),
                    style: theme.textTheme.bodyMedium!
                        .copyWith(fontSize: 11, color: theme.indicatorColor.withOpacity(0.8)),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
