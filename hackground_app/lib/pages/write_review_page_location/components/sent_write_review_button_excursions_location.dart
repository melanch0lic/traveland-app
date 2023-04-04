import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../detailis_event_page/detailis_event_page_model.dart';
import '../../detailis_location_page/detailis_location_model_page.dart';
import '../../details_housing_page/details_page_model.dart';
import '../write_review_page_location_model.dart';

class SentWriteReviewButtonLocation extends StatelessWidget {
  final int providerTypeValue;
  const SentWriteReviewButtonLocation({Key? key, required this.providerTypeValue}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isFilled = context.select((WriteReviewPageLocationViewModel model) => model.isFilled);
    return SizedBox(
      height: 48,
      child: ElevatedButton(
        style: ElevatedButton.styleFrom(
          backgroundColor: const Color.fromRGBO(37, 65, 178, 1),
          foregroundColor: const Color.fromRGBO(37, 65, 178, 0.2),
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          elevation: 0,
        ),
        onPressed: isFilled
            ? () {
                context.read<WriteReviewPageLocationViewModel>().onSentReviewButtonPressed().whenComplete(
                  () {
                    context.router.pop();
                    switch (providerTypeValue) {
                      case 1:
                        context.read<DetailsHousingPageViewModel>().init();
                        break;
                      case 2:
                        context.read<DetailsLocationPageViewModel>().init();
                        break;
                      case 3:
                        context.read<DetailsEventPageViewModel>().init();
                    }
                    showDialog(
                      context: context,
                      builder: (BuildContext context) {
                        return AlertDialog(
                          shape: const RoundedRectangleBorder(borderRadius: BorderRadius.all(Radius.circular(15))),
                          title: Text(tr('write_review_title')),
                          content: Text(tr('write_review_content')),
                          actions: [
                            TextButton(
                              child: const Text('OK'),
                              onPressed: () {
                                Navigator.of(context).pop();
                              },
                            ),
                          ],
                        );
                      },
                    );
                  },
                );
              }
            : null,
        child: Center(
          child: Text(
            tr('sent_review_text'),
            style: theme.textTheme.bodyLarge!.copyWith(color: Colors.white, fontWeight: FontWeight.w400, fontSize: 16),
          ),
        ),
      ),
    );
  }
}
