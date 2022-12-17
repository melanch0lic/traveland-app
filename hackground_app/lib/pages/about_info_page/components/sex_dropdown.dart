import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

class SexDropDown extends StatelessWidget {
  const SexDropDown({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final List<String> genderItems = [
      'Male',
      'Female',
    ];
    final theme = Theme.of(context);
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
            border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(15),
                borderSide: BorderSide(
                  color: theme.textTheme.bodyText2!.color!,
                  width: 2,
                )),
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
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: (value) {
            //Do something when changing the item if you want.
          },
          onSaved: (value) {
            // selectedValue = value.toString();
          },
        )
      ],
    );
  }
}
