import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../write_review_page_location_model.dart';

class WriteReviewTextfieldLocation extends StatelessWidget {
  const WriteReviewTextfieldLocation({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return Container(
        height: 144,
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(15),
          border: Border.all(
            width: 2,
            color: const Color.fromRGBO(174, 174, 178, 1),
          ),
        ),
        child: TextField(
          onChanged: (value) => context.read<WriteReviewPageLocationViewModel>().onReviewTextChange(value),
          controller: context.read<WriteReviewPageLocationViewModel>().textController,
          buildCounter: (BuildContext context,
              {required int currentLength, required bool isFocused, required int? maxLength}) {
            return Text(
              '$currentLength / $maxLength',
              style: TextStyle(
                color: currentLength == maxLength ? Colors.red : Colors.black,
                fontSize: 16,
              ),
            );
          },
          maxLength: 2000,
          style: theme.textTheme.bodyMedium!.copyWith(fontSize: 18),
          textAlignVertical: TextAlignVertical.top,
          maxLines: null,
          expands: true,
          decoration: const InputDecoration(
            border: OutlineInputBorder(borderSide: BorderSide.none),
          ),
        ));
  }
}
