import 'package:flutter/material.dart';
import 'package:flutter_localizations/flutter_localizations.dart';
import 'package:provider/provider.dart';

import 'app_initialization.dart';
import 'app_localizations.dart';
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
                      theme: AppTheme.lightTheme,
                      debugShowCheckedModeBanner: false,
                      localizationsDelegates: const [
                        AppLocalizations.delegate,
                        GlobalMaterialLocalizations.delegate,
                        GlobalWidgetsLocalizations.delegate,
                      ],
                      localeResolutionCallback: (locale, supportedLocales) {
                        if (supportedLocales.contains(locale)) {
                          return locale;
                        }
                        return supportedLocales.first;
                      },
                      title: 'Hackground Booking',
                      routerDelegate: appRouter.delegate(),
                      routeInformationParser: appRouter.defaultRouteParser(),
                    );
            });
      }),
    );
  }
}
