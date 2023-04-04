import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';

import '../../../data/network/models/entity/event_entity.dart';

class PriceEventWidget extends StatelessWidget {
  final EventsEntity selectedModel;
  const PriceEventWidget({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Row(children: [
      SvgPicture.asset(
        'assets/images/wallet_icon.svg',
        color: theme.primaryColorDark,
      ),
      const SizedBox(width: 5),
      RichText(
        text: TextSpan(
          text: 'от ',
          style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
          children: [
            TextSpan(text: '${selectedModel.price.value} ₽', style: const TextStyle(fontWeight: FontWeight.bold)),
          ],
        ),
      )
    ]);
  }
}
