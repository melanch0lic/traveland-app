import 'package:dropdown_button2/dropdown_button2.dart';

import 'package:flutter/material.dart';

import 'package:flutter_svg/svg.dart';
import 'package:hackground_app/pages/editing_profile_page/components/edit_delete_acc_button.dart';
import 'package:hackground_app/pages/editing_profile_page/components/edit_sex_drop_down.dart';

import '../../app_localizations.dart';
import '../../data/network/models/entity/user_info_entity.dart';
import 'components/edit_email_textfield.dart';
import 'components/edit_user_name_textfield.dart';

class EditingProfilePage extends StatelessWidget {
  final UserInfoEntity userInfo;
  const EditingProfilePage({Key? key, required this.userInfo})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final List<String> genderItems = [
      translate(context, 'male_text'),
      translate(context, 'female_text'),
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
          style: theme.textTheme.headline2!.copyWith(
            color: Colors.black,
            fontSize: 20,
            fontWeight: FontWeight.w500,
          ),
        ),
        backgroundColor: theme.primaryColorLight,
      ),
      body: Padding(
        padding:
            const EdgeInsets.only(left: 15, right: 15, top: 30, bottom: 45),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            EditUserNameTextField(theme: theme, userInfo: userInfo),
            const SizedBox(height: 20),
            EditEmailTextField(theme: theme, userInfo: userInfo),
            const SizedBox(height: 20),
            Text('Пол', style: theme.textTheme.bodyText2),
            const SizedBox(height: 10),
            EditSexDropDown(
                theme: theme, userInfo: userInfo, genderItems: genderItems),
            const Spacer(),
            EditDeleteAccButton(theme: theme),
          ],
        ),
      ),
    );
  }
}
