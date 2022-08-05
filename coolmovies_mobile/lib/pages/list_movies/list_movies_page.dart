import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../core/core.dart';
import '../../repositories/repositories.dart';
import 'list_movies.dart';

class ListMoviesPage extends StatefulWidget {
  const ListMoviesPage({Key? key}) : super(key: key);

  @override
  State<ListMoviesPage> createState() => _ListMoviesPageState();
}

class _ListMoviesPageState extends State<ListMoviesPage> {
  final ValueNotifier<List<MovieModel>> _movies = ValueNotifier([]);

  Future _fetchData() async {
    debugPrint('Fetching data...');
    final client = GraphQLProvider.of(context).value;
    final repository = ConcreteMovieRepository(
      client,
      AdaptedFlutterSecureStorage(const FlutterSecureStorage()),
    );
    final result = await repository.getAllMovies();
    result.fold(
      (left) => null,
      (movies) => _movies.value = [...movies, ...movies],
    );
  }

  @override
  Widget build(BuildContext context) {
    _fetchData();

    return SafeArea(
      bottom: false,
      child: Scaffold(
        body: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SizedBox(height: context.height * .03),
            const ListMoviesPageHeader(),
            SizedBox(height: context.height * .03),
            MoviesList(movies: _movies),
          ],
        ),
      ),
    );
  }
}
