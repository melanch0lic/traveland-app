import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

class NotifyRowWidget extends StatelessWidget {
  const NotifyRowWidget({
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
            'Уведомления',
            style: theme.textTheme.headline2!.copyWith(
              color: Colors.black,
              fontSize: 16,
              fontWeight: FontWeight.w400,
            ),
          ),
          FlutterSwitch(
            width: 44,
            height: 24,
            toggleSize: 15,
            inactiveColor: Color.fromRGBO(142, 142, 147, 1),
            activeColor: Color.fromRGBO(37, 65, 178, 1),
            toggleBorder: Border.all(width: 2, color: Colors.white),
            toggleColor: Colors.white,
            onToggle: (bool value) {},
            value: true,
          ),
        ],
      ),
    );
  }
}
