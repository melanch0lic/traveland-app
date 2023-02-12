import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
// ignore: prefer_relative_imports
import 'package:hackground_app/pages/detailis_event_page/detailis_event_page_model.dart';
import 'package:hackground_app/widgets/actions_icons_appbar_widget.dart';
import 'package:provider/provider.dart';
import '../../data/network/models/entity/event_entity.dart';
import 'components/body_event.dart';

class DetailisEventPage extends StatelessWidget {
  final EventsEntity selectedModel;
  const DetailisEventPage({Key? key, required this.selectedModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
        create: (context) => DetailsEventPageViewModel(),
        child: Builder(builder: (context) {
          final isFullTextShowed = context.select(
            (DetailsEventPageViewModel model) => model.isFullTextShowed,
          );
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
              title: Expanded(
                child: Text(
                  selectedModel.placeInfo.name,
                  style: theme.textTheme.headline2!.copyWith(
                    color: Colors.black,
                    fontSize: 20,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
              actions: const [
                ActionsIconsAppBarWidget(),
              ],
              backgroundColor: theme.primaryColorLight,
            ),
            body: BodyEvent(
              selectedModel: selectedModel,
              theme: theme,
              isFullTextShowed: isFullTextShowed,
            ),
          );
        }));
  }
}
