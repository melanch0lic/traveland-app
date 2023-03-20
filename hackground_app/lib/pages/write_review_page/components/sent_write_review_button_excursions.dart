import 'package:auto_route/auto_route.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../write_review_page_model.dart';

class SentWriteReviewButtonExcursions extends StatelessWidget {
  const SentWriteReviewButtonExcursions({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isFilled = context.select((WriteReviewPageViewModel model) => model.isFilled);
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
                context.read<WriteReviewPageViewModel>().onSentReviewButtonPressed().whenComplete(
                  () {
                    context.router.pop();
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
