import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../domain/models/attraction_model.dart';
import 'components/image_slider.dart';

class DetailsPage extends StatelessWidget {
  final Attraction selectedModel;
  const DetailsPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Scaffold(
        appBar: AppBar(
          leading: IconButton(
            highlightColor: theme.cardColor,
            splashRadius: 15,
            icon: SvgPicture.asset(
              'assets/images/back_arrow_icon.svg',
              color: Colors.black,
            ),
            onPressed: () => Navigator.of(context).pop(),
          ),
          title: Text(
            '${selectedModel.name}',
            style: theme.textTheme.headline2!.copyWith(color: Colors.black, fontSize: 20, fontWeight: FontWeight.w500),
          ),
          backgroundColor: theme.primaryColorLight,
        ),
        body: Column(
          children: const [ImageSlider()],
        ));
  }
}
