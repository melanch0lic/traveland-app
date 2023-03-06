import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../data/network/models/entity/tour_entity.dart';
import 'components/body_excursion.dart';
import 'detailis_exursion_page_model.dart';

class DetailisExursionPage extends StatelessWidget {
  final TourEntity selectedModel;
  const DetailisExursionPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
        create: (context) => DetailsExursionPageViewModel(context.read<InitializeProvider>().cachedDataRepository,
            context.read<InitializeProvider>().excursionsService, selectedModel.id),
        child: Builder(builder: (context) {
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
                selectedModel.title,
                style: theme.textTheme.displayMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              actions: [
                IconButton(
                  splashRadius: 15,
                  icon: SvgPicture.asset(
                    'assets/images/heart.svg',
                    color: Colors.black,
                  ),
                  onPressed: () {},
                ),
              ],
              backgroundColor: theme.primaryColorLight,
            ),
            body: BodyExcursion(selectedModel: selectedModel),
          );
        }));
  }
}
