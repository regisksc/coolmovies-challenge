import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:responsive_framework/responsive_framework.dart';

import 'core/core.dart';
import 'pages/list_movies/list_movies_page.dart';

void main() async {
  await initHiveForFlutter();

  final client = ValueNotifier(
    GraphQLClient(
      link: link,
      cache: gqlCache,
    ),
  );

  runApp(GraphQLProvider(
    client: client,
    child: const MyApp(),
  ));
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  static const title = 'Coolmovies';

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: MyApp.title,
      debugShowCheckedModeBanner: false,
      builder: (context, widget) => ResponsiveWrapper.builder(
        ClampingScrollWrapper.builder(context, widget!),
        breakpoints: const [
          ResponsiveBreakpoint.resize(350, name: MOBILE),
          ResponsiveBreakpoint.autoScale(600, name: TABLET),
        ],
      ),
      theme: ThemeData(primarySwatch: Colors.blue),
      home: const ListMoviesPage(title: MyApp.title),
    );
  }
}
