import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackground_app/data/network/models/entity/place_entity.dart';

class PriceLocationWidget extends StatelessWidget {
  const PriceLocationWidget({
    Key? key,
    required this.theme,
    required this.selectedModel,
  }) : super(key: key);

  final ThemeData theme;
  final PlaceEntity selectedModel;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(
          'assets/images/wallet_icon.svg',
          color: theme.primaryColorDark,
        ),
        const SizedBox(width: 5),
        Text(
          selectedModel.price.value,
          style: Theme.of(context).textTheme.bodyText2?.copyWith(
                color: const Color.fromRGBO(44, 44, 46, 1),
                fontSize: 16,
                fontWeight: FontWeight.w400,
              ),
        )
      ],
    );
  }
}
