import 'package:flutter/material.dart';
import 'package:flutter_switch/flutter_switch.dart';

import 'heading_filter_widget.dart';

class HeadingAndSwitchRow extends StatelessWidget {
  const HeadingAndSwitchRow({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        const HeadingFilterWidget(heading: 'ЫФВФВЫФВФВЫФ'),
        FlutterSwitch(
          width: 44,
          height: 24,
          toggleSize: 15,
          inactiveColor: Color.fromRGBO(142, 142, 147, 1),
          activeColor: Color.fromRGBO(37, 65, 178, 1),
          toggleBorder: Border.all(width: 2, color: Colors.white),
          toggleColor: Colors.white,
          onToggle: (bool value) {},
          value: false,
        ),
      ],
    );
  }
}
