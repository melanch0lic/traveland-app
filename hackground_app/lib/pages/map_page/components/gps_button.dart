import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class GpsButton extends StatelessWidget {
  const GpsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black.withOpacity(0.6),
      onPressed: () {},
      child: SvgPicture.asset(
        'assets/images/location_line_icon.svg',
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
