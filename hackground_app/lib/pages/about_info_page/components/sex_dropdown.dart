import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../about_info_page_model.dart';

class SexDropDown extends StatelessWidget {
  const SexDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> genderItems = [
      tr('male_text'),
      tr('female_text'),
    ];
    final theme = Theme.of(context);
    final isSexCorrect = context.select((AboutInfoPageViewModel model) => model.isSexCorrect);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          tr('gender_text'),
          style: theme.textTheme.bodyMedium,
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField2(
          style: theme.textTheme.bodyMedium,
          decoration: InputDecoration(
            contentPadding: const EdgeInsets.all(15),
            hintStyle: theme.textTheme.bodyMedium,
            hintText: tr('not_specified_text'),
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isSexCorrect ? theme.textTheme.bodyMedium!.color! : const Color.fromRGBO(255, 47, 47, 1),
                  width: 2),
            ),
            focusedBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isSexCorrect ? theme.indicatorColor : const Color.fromRGBO(255, 47, 47, 1), width: 2),
            ),
          ),
          items: genderItems
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: theme.textTheme.bodyMedium,
                    ),
                  ))
              .toList(),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          onChanged: (value) => context.read<AboutInfoPageViewModel>().onSexChange(value.toString()),
        )
      ],
    );
  }
}
