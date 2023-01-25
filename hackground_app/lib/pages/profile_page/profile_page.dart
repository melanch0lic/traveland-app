import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../dummy_data.dart';
import '../../widgets/name_row_header.dart';
import '../../widgets/event_small_listview.dart';
import 'components/info_user_widget.dart';
import 'components/log_out_button.dart';
import 'profile_page_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => ProfilePageViewModel(context.read<InitializeProvider>().authService),
      child: Builder(builder: (context) {
        final isLoading = context.select((ProfilePageViewModel model) => model.isLoading);
        return Scaffold(
          body: isLoading
              ? const Center(
                  child: CircularProgressIndicator(),
                )
              : SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.stretch,
                        children: const [
                          InfoUserWidget(),
                          // const InfoUserProgressWidget(),
                          NameRowHeader(name: 'Избранное'),
                          SizedBox(height: 15),
                          // EventSmallListView(attractionListHouse),
                          SizedBox(height: 30),
                          LogOutButton(),
                        ],
                      ),
                    ),
                  ),
                ),
        );
      }),
    );
  }
}
