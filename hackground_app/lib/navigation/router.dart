import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import '../pages/details_page/details_page.dart';
import '../pages/guide_page/guide_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/hubs_page/hubs_page.dart';
import '../pages/login_page.dart/login_page.dart';
import '../pages/map_page/map_page.dart';
import '../pages/register_page/register_page.dart';
import '../pages/start_page/start_page.dart';
import '../pages/tabs_page/tabs_page.dart';

import '../pages/tours_page/tours_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      name: 'LoginRouter',
      page: EmptyRouterPage,
      children: [
        AutoRoute(path: '', page: StartPage),
        AutoRoute(path: 'login', page: LoginPage),
        AutoRoute(path: 'register', page: RegisterPage)
      ],
    ),
    AutoRoute(
      path: '/tabs/',
      page: TabsPage,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(page: HomePage, initial: true),
            AutoRoute(path: ':selectedModel', page: DetailsPage),
          ],
        ),
        AutoRoute(path: 'hotels', name: 'HotelsRouter', page: EmptyRouterPage, children: [
          AutoRoute(path: '', page: ToursPage),
          AutoRoute(path: ':selectedModel', page: DetailsPage),
        ]),
        AutoRoute(
          path: 'map',
          name: 'MapRouter',
          page: MapPage,
        ),
        AutoRoute(
          path: 'hubs',
          name: 'HubsRouter',
          page: HubsPage,
        ),
        AutoRoute(
          path: 'guides',
          name: 'GuidesRouter',
          page: GuidePage,
        )
      ],
    )
  ],
)
class $AppRouter {}
