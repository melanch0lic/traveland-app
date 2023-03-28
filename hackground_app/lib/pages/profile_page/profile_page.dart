import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:provider/provider.dart';

import '../../app_initialization.dart';
import 'components/info_user_widget.dart';
import 'components/log_out_button.dart';
import 'profile_page_model.dart';

class ProfilePage extends StatelessWidget {
  const ProfilePage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final isGuestMode = context.select((InitializeProvider model) => model.isGuestMode);
    return isGuestMode
        ? Scaffold(
            appBar: AppBar(
              title: Text(
                'Профиль',
                style: theme.textTheme.displayMedium!.copyWith(
                  color: Colors.black,
                  fontSize: 20,
                  fontWeight: FontWeight.w500,
                ),
              ),
            ),
            body: Center(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                child: Column(mainAxisAlignment: MainAxisAlignment.center, children: [
                  Text(
                    'Необходима авторизация',
                    style: theme.textTheme.bodyLarge!.copyWith(color: Colors.black),
                  ),
                  const SizedBox(height: 5),
                  const LogOutButton(),
                ]),
              ),
            ),
          )
        : ChangeNotifierProvider(
            create: (context) => ProfilePageViewModel(context.read<InitializeProvider>().authService),
            child: Builder(builder: (context) {
              final isLoading = context.select((ProfilePageViewModel model) => model.isLoading);
              return Scaffold(
                appBar: AppBar(
                  title: Text(
                    'Профиль',
                    style: theme.textTheme.displayMedium!.copyWith(
                      color: Colors.black,
                      fontSize: 20,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                  // actions: [
                  //   if (!isLoading) ...[
                  //     IconButton(
                  //       splashRadius: 15,
                  //       icon: SvgPicture.asset(
                  //         'assets/images/redact.svg',
                  //         color: Colors.black,
                  //       ),
                  //       onPressed: () => context.router
                  //           .push(EditingProfileRoute(userInfo: context.read<ProfilePageViewModel>().userInfo!)),
                  //     ),
                  //     IconButton(
                  //       splashRadius: 15,
                  //       icon: SvgPicture.asset(
                  //         'assets/images/settings.svg',
                  //         color: Colors.black,
                  //       ),
                  //       onPressed: () => context.router.push(const ApplicationSettingsRoute()),
                  //     ),
                  //   ]
                  // ],
                ),
                body: isLoading
                    ? SpinKitSpinningLines(color: theme.indicatorColor)
                    : Padding(
                        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 30),
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: const [
                            InfoUserWidget(),
                            // const InfoUserProgressWidget(),
                            // NameRowHeader(name: 'Избранное'),
                            SizedBox(height: 15),
                            // EventSmallListView(attractionListHouse),
                            SizedBox(height: 30),
                            LogOutButton(),
                          ],
                        ),
                      ),
              );
            }),
          );
  }
}
