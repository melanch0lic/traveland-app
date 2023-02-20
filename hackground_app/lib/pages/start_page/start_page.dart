import 'package:auto_route/auto_route.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:provider/provider.dart';
import '../../app_initialization.dart';
import 'components/main_content_column.dart';

class StartPage extends StatelessWidget {
  const StartPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    if (context.read<InitializeProvider>().isUserAuthorized) {
      context
          .read<InitializeProvider>()
          .authService
          .refreshToken()
          .whenComplete(() => context.router.replaceNamed('/tabs'));
    }
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(14),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Center(
              child: SvgPicture.asset('assets/images/logo.svg'),
            ),
            const MainContentColumn(),
          ],
        ),
      )),
    );
  }
}
