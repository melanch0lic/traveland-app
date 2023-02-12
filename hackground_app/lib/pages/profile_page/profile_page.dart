import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import '../../navigation/router.gr.dart';
import '../../widgets/name_row_header.dart';
import 'components/info_user_widget.dart';
import 'components/log_out_button.dart';
import 'profile_page_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    return ChangeNotifierProvider(
      create: (context) =>
          ProfilePageViewModel(context.read<InitializeProvider>().authService),
      child: Builder(builder: (context) {
        final isLoading =
            context.select((ProfilePageViewModel model) => model.isLoading);
        return isLoading
            ? const Center(
                child: CircularProgressIndicator(),
              )
            : Scaffold(
                appBar: AppBar(
                  title: Expanded(
                    child: Text(
                      'Профиль',
                      style: theme.textTheme.headline2!.copyWith(
                        color: Colors.black,
                        fontSize: 20,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),
                  actions: [
                    IconButton(
                      splashRadius: 15,
                      icon: SvgPicture.asset(
                        'assets/images/redact.svg',
                        color: Colors.black,
                      ),
                      onPressed: () => context.router.push(EditingProfileRoute(
                          userInfo:
                              context.read<ProfilePageViewModel>().userInfo)),
                    ),
                    IconButton(
                      splashRadius: 15,
                      icon: SvgPicture.asset(
                        'assets/images/settings.svg',
                        color: Colors.black,
                      ),
                      onPressed: () =>
                          context.router.push(const ApplicationSettingsRoute()),
                    ),
                  ],
                ),
                body: SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 15, vertical: 30),
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
