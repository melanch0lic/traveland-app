import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class AutoLoadRowWidget extends StatelessWidget {
  const AutoLoadRowWidget({
    Key? key,
    required this.theme,
  }) : super(key: key);

  final ThemeData theme;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 15, right: 30),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Text(
            'Автосохранение маршрутов',
            style: theme.textTheme.displayMedium!.copyWith(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          FlutterSwitch(
            width: 44,
            height: 24,
            toggleSize: 15,
            inactiveColor: const Color.fromRGBO(142, 142, 147, 1),
            activeColor: const Color.fromRGBO(37, 65, 178, 1),
            toggleBorder: Border.all(width: 2, color: Colors.white),
            onToggle: (bool value) {},
            value: false,
          ),
        ],
      ),
    );
  }
}
