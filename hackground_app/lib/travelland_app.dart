import 'package:easy_localization/easy_localization.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'app_initialization.dart';
import 'theme/app_theme.dart';

class TravellandApp extends StatelessWidget {
  const TravellandApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (context) => InitializeProvider(),
      child: Builder(builder: (context) {
        return FutureBuilder(
            future: context.read<InitializeProvider>().initializeApp(),
            builder: (context, snapshot) {
              final appRouter = context.read<InitializeProvider>().appRouter;
              return snapshot.connectionState == ConnectionState.waiting
                  ? const SizedBox.shrink()
                  : MaterialApp.router(
                      title: 'Traveland',
                      localizationsDelegates: context.localizationDelegates,
                      supportedLocales: context.supportedLocales,
                      locale: context.locale,
                      theme: AppTheme.lightTheme,
                      debugShowCheckedModeBanner: false,
                      routerDelegate: appRouter.delegate(),
                      routeInformationParser: appRouter.defaultRouteParser(),
                    );
            });
      }),
    );
  }
}
