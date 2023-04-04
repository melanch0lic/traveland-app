import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../data/network/models/entity/event_entity.dart';
import 'components/body_event.dart';
import 'detailis_event_page_model.dart';

class DetailisEventPage extends StatelessWidget {
  final EventsEntity selectedModel;
  const DetailisEventPage({Key? key, required this.selectedModel}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
        create: (context) => DetailsEventPageViewModel(context.read<InitializeProvider>().cachedDataRepository,
            context.read<InitializeProvider>().reviewsService, selectedModel.placeInfo.id),
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
            body: BodyEvent(
              selectedModel: selectedModel,
            ),
          );
        }));
  }
}
