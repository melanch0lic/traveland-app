import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../data/network/models/entity/user_info_entity.dart';
import 'components/edit_delete_acc_button.dart';
import 'components/edit_email_textfield.dart';
import 'components/edit_sex_drop_down.dart';
import 'components/edit_user_name_textfield.dart';

class EditingProfilePage extends StatelessWidget {
  final UserInfoEntity userInfo;
  const EditingProfilePage({Key? key, required this.userInfo}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> genderItems = [
      tr('male_text'),
      tr('female_text'),
    ];
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
          'Редактирование профиля',
          style: theme.textTheme.displayMedium!.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: theme.primaryColorLight,
      ),
      body: Padding(
        padding: const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditUserNameTextField(theme: theme, userInfo: userInfo),
            const SizedBox(height: 20),
            EditEmailTextField(theme: theme, userInfo: userInfo),
            const SizedBox(height: 20),
            Text('Пол', style: theme.textTheme.bodyMedium),
            const SizedBox(height: 10),
            EditSexDropDown(theme: theme, userInfo: userInfo, genderItems: genderItems),
            const Spacer(),
            EditDeleteAccButton(theme: theme),
          ],
        ),
      ),
    );
  }
}
