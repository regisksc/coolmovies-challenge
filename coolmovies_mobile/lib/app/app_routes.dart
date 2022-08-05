import 'package:flutter/material.dart';

import '../pages/pages.dart';

class AppRoutes {
  AppRoutes._();

  static const String initialRoute = home;

  static const String home = '/';
  static const String movie = '/movie';

  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      AppRoutes.home: (context) => const ListMoviesPage(),
      AppRoutes.movie: (context) => const MovieDetailPage(),
    };
  }
}
