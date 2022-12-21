import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../app_localizations.dart';
import '../about_info_page_model.dart';

class SexDropDown extends StatelessWidget {
  const SexDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> genderItems = [
      translate(context, 'male_text'),
      translate(context, 'female_text'),
    ];
    final theme = Theme.of(context);
    final isSexCorrect = context.select((AboutInfoPageViewModel model) => model.isSexCorrect);
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Пол',
          style: theme.textTheme.bodyText2,
        ),
        const SizedBox(height: 10),
        DropdownButtonFormField2(
          style: theme.textTheme.bodyText2,
          decoration: InputDecoration(
            hintStyle: theme.textTheme.bodyText2,
            hintText: 'Не указан',
            enabledBorder: OutlineInputBorder(
              borderRadius: BorderRadius.circular(15),
              borderSide: BorderSide(
                  color: isSexCorrect ? theme.textTheme.bodyText2!.color! : const Color.fromRGBO(255, 47, 47, 1),
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
                      style: theme.textTheme.bodyText2,
                    ),
                  ))
              .toList(),
          buttonPadding: const EdgeInsets.only(left: 20, right: 10),
          dropdownDecoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
          ),
          isExpanded: true,
          validator: (value) {
            if (value == null) {
              return 'None';
            }
            return null;
          },
          onChanged: (value) => context.read<AboutInfoPageViewModel>().onSexChange(value.toString()),
          onSaved: (value) {
            // selectedValue = value.toString();
          },
        )
      ],
    );
  }
}
