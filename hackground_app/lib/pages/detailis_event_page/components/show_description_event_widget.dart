import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_localizations.dart';
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
          isFullTextShowed
              ? translate(context, 'hide_text')
              : translate(context, 'show_full_text'),
          style:
              theme.textTheme.bodyText2!.copyWith(color: theme.indicatorColor),
        ));
  }
}
