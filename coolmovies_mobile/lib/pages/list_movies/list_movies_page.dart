import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../core/core.dart';
import '../../repositories/repositories.dart';
import 'widgets/movie_list_tile/movie_list_tile_widget.dart';

class ListMoviesPage extends StatefulWidget {
  const ListMoviesPage({Key? key, required this.title}) : super(key: key);
  final String title;

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
        body: ValueListenableBuilder(
          valueListenable: _movies,
          builder: (context, _, child) {
            return MoviesList(
              movies: _movies.value,
            );
          },
        ),
      ),
    );
  }
}

class MoviesList extends StatelessWidget {
  const MoviesList({
    Key? key,
    required this.movies,
  }) : super(key: key);

  final List<MovieModel> movies;

  @override
  Widget build(BuildContext context) {
    final spacing = context.width * .1;
    return SizedBox(
      width: context.width,
      height: context.height * .6,
      child: ListView.separated(
        itemCount: movies.length,
        scrollDirection: Axis.horizontal,
        separatorBuilder: (context, __) => SizedBox(width: spacing),
        itemBuilder: (BuildContext context, int index) {
          final movie = movies[index];
          return Container(
            padding: EdgeInsets.symmetric(vertical: context.height * .02),
            margin: EdgeInsets.only(
                bottom: context.height * .03,
                left: index == 0 ? spacing : 0,
                right: index >= movies.length - 1 ? spacing : 0),
            child: MovieListTile(movie),
          );
        },
      ),
    );
  }
}
