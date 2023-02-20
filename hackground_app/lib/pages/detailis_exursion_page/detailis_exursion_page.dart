import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:hackground_app/pages/detailis_exursion_page/components/body_excursion.dart';
import 'package:hackground_app/widgets/actions_icons_appbar_widget.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';

import '../../data/network/models/entity/tour_entity.dart';
import 'detailis_exursion_page_model.dart';

class DetailisExursionPage extends StatelessWidget {
  final TourEntity selectedModel;
  const DetailisExursionPage({Key? key, required this.selectedModel})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
        create: (context) => DetailsExursionPageViewModel(
            context.read<InitializeProvider>().cachedDataRepository),
        child: Builder(builder: (context) {
          final isFullTextShowed = context.select(
            (DetailsExursionPageViewModel model) => model.isFullTextShowed,
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
                  selectedModel.title,
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
            body: BodyExcursion(
              selectedModel: selectedModel,
              theme: theme,
              isFullTextShowed: isFullTextShowed,
            ),
          );
        }));
  }
}
