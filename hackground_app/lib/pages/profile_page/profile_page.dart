import 'package:flutter/material.dart';

import '../../dummy_data.dart';
import '../../widgets/name_row_header.dart';
import '../home_page/components/attraction_listview.dart';
import 'components/info_user_progress_widget.dart';
import 'components/info_user_widget.dart';
import 'components/log_out_button.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                const InfoUserWidget(),
                const InfoUserProgressWidget(),
                const NameRowHeader(name: 'Избранное'),
                const SizedBox(height: 15),
                AttractionListView(attractionListHouse),
                const SizedBox(height: 30),
                const LogOutButton(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
