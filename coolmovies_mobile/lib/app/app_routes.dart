import 'package:flutter/material.dart';

import '../pages/pages.dart';

class AppRoutes {
  AppRoutes._();

  static const String home = '/';

  static Map<String, Widget Function(BuildContext)> get routes {
    return {
      AppRoutes.home: (context) => const ListMoviesPage(),
    };
  }
}
