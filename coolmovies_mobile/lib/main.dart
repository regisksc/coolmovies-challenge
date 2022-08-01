import 'package:flutter/material.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

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

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const ListMoviesPage(title: 'Coolmovies'),
    );
  }
}
