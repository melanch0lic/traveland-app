import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../data/network/models/entity/place_entity.dart';
import 'components/body_location.dart';
import 'detailis_location_model_page.dart';

class DetailisLocationPage extends StatelessWidget {
  final PlaceEntity selectedModel;
  const DetailisLocationPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
        create: (context) => DetailsLocationPageViewModel(context.read<InitializeProvider>().cachedDataRepository,
            context.read<InitializeProvider>().placesService, selectedModel.placeInfo.id),
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
                selectedModel.placeInfo.name,
                style: theme.textTheme.displayMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
              backgroundColor: theme.primaryColorLight,
            ),
            body: BodyLocation(
              selectedModel: selectedModel,
              theme: theme,
            ),
          );
        }));
  }
}
