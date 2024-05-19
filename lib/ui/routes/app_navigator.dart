import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/pages/categories/now_playing.dart';
import 'package:movies_app/ui/pages/categories/top_rated.dart';
import 'package:movies_app/ui/pages/categories/popular.dart';
import 'package:movies_app/ui/pages/categories/upcoming.dart';
import 'package:movies_app/ui/pages/categories_page.dart';
import 'package:movies_app/ui/pages/detail_page.dart';
import 'package:movies_app/ui/pages/error_page.dart';
import 'package:movies_app/ui/pages/internet_check_page.dart';
import 'package:movies_app/ui/pages/login_page.dart';
import 'package:movies_app/ui/pages/main_page.dart';
import 'package:movies_app/ui/routes/app_routes.dart';

class AppRoutes {
  static final _routes = GoRouter(
    routes: [
      GoRoute(
        path: RouteNames.home,
        builder: (context, state) => const LoginPage(),
      ),
      GoRoute(
        path: RouteNames.mainPage,
        builder: (context, state) => const MainPage(),
      ),
      GoRoute(
          path: RouteNames.detailPage,
          builder: (context, state) => const DetailPage()),
      GoRoute(
        path: RouteNames.error,
        builder: (context, state) => const ErrorPage(),
      ),

      //categories

      GoRoute(
        path: '/top10',
        name: RouteNames.nowPlayingPage,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: NowPlaying(),
          );
        },
      ), GoRoute(
        path: '/',
        name: RouteNames.internetCheck,
        pageBuilder: (context, state) {
          return  MaterialPage(
            child: InternetCheckPage(),
          );
        },
      ),
      GoRoute(
        path: '/popular',
        name: RouteNames.popularPage,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: PopularPage(),
          );
        },
      ),
      GoRoute(
        path: '/trated',
        name: RouteNames.topRatedPage,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: TopRatedPage(),
          );
        },
      ),
      GoRoute(
        path: '/upcoming',
        name: RouteNames.upcomingPage,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: UpcomingPage(),
          );
        },
      ),
      GoRoute(
        path: '/categoriesPage',
        name: RouteNames.categoriesPage,
        pageBuilder: (context, state) {
          return const MaterialPage(
            child: CategoriesPage(),
          );
        },
      ),
    ],
  );

  static GoRouter get routes => _routes;
}
