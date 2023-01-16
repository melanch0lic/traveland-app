import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../pages/about_info_page/about_info_page.dart';
import '../pages/detailis_exursion_page/detailis_exursion_page.dart';
import '../pages/details_page/details_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/hotels_page/hotels_page.dart';
import '../pages/login_page.dart/login_page.dart';
import '../pages/map_page/map_page.dart';
import '../pages/places_page/places_page.dart';
import '../pages/profile_page/profile_page.dart';
import '../pages/register_page/register_page.dart';
import '../pages/start_page/start_page.dart';
import '../pages/tabs_page/tabs_page.dart';

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
        AutoRoute(
            path: 'register',
            name: 'RegisterRouter',
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: RegisterPage),
              AutoRoute(path: 'aboutInfo', page: AboutInfoPage)
            ])
      ],
    ),
    AutoRoute(
      path: '/tabs',
      name: 'TabsRouter',
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
        AutoRoute(
            path: 'hotels',
            name: 'HotelsRouter',
            page: EmptyRouterPage,
            children: [
              AutoRoute(path: '', page: HotelsPage),
              AutoRoute(path: ':selectedModel', page: DetailsPage),
            ]),
        AutoRoute(
          path: 'map',
          name: 'MapRouter',
          page: MapPage,
        ),
        AutoRoute(
          path: 'places',
          name: 'PlacesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(page: PlacesPage, initial: true),
            AutoRoute(path: ':selectedModel', page: DetailisExursionPage),
          ],
        ),
        AutoRoute(
          path: 'guides',
          name: 'GuidesRouter',
          page: ProfilePage,
        )
      ],
    )
  ],
)
class $AppRouter {}
