import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:responsive_framework/responsive_framework.dart';

import '../core/core.dart';
import '../pages/pages.dart';
import 'app_routes.dart';

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const title = 'Coolmovies';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.title,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) {
        final theme = context.theme;
        final nunitoFF = GoogleFonts.nunito().fontFamily;
        final rubikFF = GoogleFonts.rubik().fontFamily;
        final tt = theme.textTheme;
        final textTheme = tt.copyWith(
          bodyLarge: tt.bodyLarge!.copyWith(fontFamily: nunitoFF),
          bodyMedium: tt.bodyLarge!.copyWith(fontFamily: nunitoFF),
          bodySmall: tt.bodyLarge!.copyWith(fontFamily: nunitoFF),
          headlineSmall: tt.headlineSmall!.copyWith(
            fontFamily: rubikFF,
            fontSize: 12,
            fontWeight: FontWeight.w600,
          ),
          headlineMedium: tt.headlineMedium!.copyWith(fontFamily: rubikFF),
          headlineLarge: tt.headlineLarge!.copyWith(fontFamily: rubikFF),
        );
        return Theme(
          data: theme.copyWith(textTheme: textTheme),
          child: ResponsiveWrapper.builder(
            ClampingScrollWrapper.builder(context, widget!),
            breakpoints: const [
              ResponsiveBreakpoint.resize(350, name: MOBILE),
              ResponsiveBreakpoint.autoScale(600, name: TABLET),
            ],
          ),
        );
      },
      theme: ThemeData(primarySwatch: Colors.blue),
      routes: AppRoutes.routes,
      initialRoute: AppRoutes.home,
    );
  }
}
