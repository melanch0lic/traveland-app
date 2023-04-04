import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:flutter/material.dart';

import '../../../data/network/models/entity/user_info_entity.dart';

class EditSexDropDown extends StatelessWidget {
  const EditSexDropDown({
    Key? key,
    required this.theme,
    required this.userInfo,
    required this.genderItems,
  }) : super(key: key);

  final ThemeData theme;
  final UserInfoEntity userInfo;
  final List<String> genderItems;

  @override
  Widget build(BuildContext context) {
    return DropdownButtonFormField2(
      style: theme.textTheme.bodyMedium,
      decoration: InputDecoration(
        contentPadding: const EdgeInsets.all(15),
        hintStyle: theme.textTheme.bodyMedium,
        hintText: userInfo.sex ? 'Мужской' : 'Женский',
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 2),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(15),
          borderSide: const BorderSide(width: 2),
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
      buttonPadding: const EdgeInsets.only(left: 20, right: 10),
      dropdownDecoration: BoxDecoration(
        borderRadius: BorderRadius.circular(15),
      ),
      isExpanded: true,
      onChanged: (value) {},
      onSaved: (value) {
        // selectedValue = value.toString();
      },
    );
  }
}
