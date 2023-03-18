import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../detailis_event_page_model.dart';

class ShowDescriptionEventWidget extends StatelessWidget {
  const ShowDescriptionEventWidget({
    Key? key,
    required this.theme,
    required this.isFullTextShowed,
  }) : super(key: key);

  final ThemeData theme;
  final bool isFullTextShowed;

  @override
  Widget build(BuildContext context) {
    return InkWell(
        onTap: () {
          context.read<DetailsEventPageViewModel>().onShowFullButtonPressed();
        },
        splashColor: Colors.black,
        highlightColor: theme.indicatorColor.withOpacity(0.5),
        child: Text(
          isFullTextShowed ? tr('hide_text') : tr('show_full_text'),
          style: theme.textTheme.bodyMedium!.copyWith(color: theme.indicatorColor),
        ));
  }
}
