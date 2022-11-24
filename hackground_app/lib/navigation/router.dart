import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';
import 'package:hackground_app/pages/details_page/details_page.dart';
import 'package:hackground_app/pages/guide_page/guide_page.dart';
import 'package:hackground_app/pages/home_page/home_page.dart';
import 'package:hackground_app/pages/hotels_page/hotels_page.dart';
import 'package:hackground_app/pages/hubs_page/hubs_page.dart';
import 'package:hackground_app/pages/map_page/map_page.dart';
import 'package:hackground_app/pages/tabs_page/tabs_page.dart';

@MaterialAutoRouter(
  replaceInRouteName: 'Page,Route',
  routes: [
    AutoRoute(
      path: '/',
      page: TabsPage,
      children: [
        AutoRoute(
          path: 'home',
          name: 'HomeRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(path: '', page: HomePage),
            AutoRoute(path: ':selectedModel', page: DetailsPage),
          ],
        ),
        AutoRoute(path: 'hotels', name: 'HotelsRouter', page: EmptyRouterPage, children: [
          AutoRoute(path: '', page: HotelsPage),
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
