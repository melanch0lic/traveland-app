import 'package:auto_route/auto_route.dart';
import 'package:auto_route/empty_router_widgets.dart';

import '../pages/about_info_page/about_info_page.dart';
import '../pages/application_settings_page/application_settings_page.dart';
import '../pages/detailis_event_page/detailis_event_page.dart';
import '../pages/detailis_exursion_page/detailis_exursion_page.dart';
import '../pages/detailis_location_page/detailis_location_page.dart';
import '../pages/details_housing_page/details_housing_page.dart';
import '../pages/editing_profile_page/editing_profile_page.dart';
import '../pages/filter_locations_page/filter_locations_page.dart';
import '../pages/home_page/home_page.dart';
import '../pages/housings_page/housings_page.dart';
import '../pages/login_page.dart/login_page.dart';
import '../pages/map_page/main_map_page.dart';
import '../pages/places_page/places_page.dart';
import '../pages/profile_page/profile_page.dart';
import '../pages/register_page/register_page.dart';
import '../pages/review_page/review_page.dart';
import '../pages/review_page/write_review_page.dart';
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
            children: [AutoRoute(path: '', page: RegisterPage), AutoRoute(path: 'aboutInfo', page: AboutInfoPage)])
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
            AutoRoute(path: ':selectedModel', page: DetailsHousingPage),
            AutoRoute(path: ':selectedModel', page: DetailisEventPage),
            AutoRoute(path: ':selectedModel', page: DetailisLocationPage),
            AutoRoute(path: ':selectedModel', page: DetailisExursionPage),
            AutoRoute(path: ':selectedModel/reviews', page: ReviewPage),
            AutoRoute(path: ':selectedModel/writeReviews', page: WriteReviewPage),
          ],
        ),
        AutoRoute(path: 'hotels', name: 'HotelsRouter', page: EmptyRouterPage, children: [
          AutoRoute(path: '', page: HousingsPage),
          AutoRoute(path: ':selectedModel', page: DetailsHousingPage),
        ]),
        AutoRoute(
          path: 'map',
          name: 'MapRouter',
          page: MainMapPage,
        ),
        AutoRoute(
          path: 'places',
          name: 'PlacesRouter',
          page: EmptyRouterPage,
          children: [
            AutoRoute(page: PlacesPage, initial: true),
            AutoRoute(path: ':selectedModel', page: DetailisExursionPage),
            AutoRoute(path: ':selectedModel', page: DetailisEventPage),
            AutoRoute(path: ':selectedModel', page: DetailisLocationPage),
            AutoRoute(path: ':selectedModel/reviews', page: ReviewPage),
            AutoRoute(path: ':selectedModel/writeReviews', page: WriteReviewPage),
            AutoRoute(page: FilterLocationsPage),
          ],
        ),
        AutoRoute(path: 'profile', name: 'ProfileRouter', page: EmptyRouterPage, children: [
          AutoRoute(page: ProfilePage, initial: true),
          AutoRoute(page: ApplicationSettingsPage),
          AutoRoute(page: EditingProfilePage),
        ])
      ],
    )
  ],
)
class $AppRouter {}
