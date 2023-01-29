import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../map_page_model.dart';

class GpsButton extends StatelessWidget {
  const GpsButton({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return FloatingActionButton(
      backgroundColor: Colors.black.withOpacity(0.6),
      onPressed: () {
        context.read<MapPageViewModel>().onLocationButtonPressed();
      },
      child: SvgPicture.asset(
        'assets/images/location_line_icon.svg',
        color: Theme.of(context).cardColor,
      ),
    );
  }
}
