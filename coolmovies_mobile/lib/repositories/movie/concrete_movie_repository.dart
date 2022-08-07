import 'package:either_dart/either.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../core/core.dart';
import '../repositories.dart';

class ConcreteMovieRepository implements MovieRepository {
  ConcreteMovieRepository(
    this.client,
    this.storage,
  );
  final GraphQLClient client;
  final StorageAdapter storage;

  String get _storageKey => 'allMovies';

  @override
  Future<Either<Failure, List<MovieModel>>> getAllMovies() async {
    return client.performFetchListQuery(
      storage,
      storageKey: _storageKey,
      gqlQuery: GQLQueries.getAllMovies,
      serializer: MovieModel.fromJson,
    );
  }

  @override
  Future storeMovies(List<MovieModel> movies) async {
    storage.write(_storageKey, {
      _storageKey: {
        'nodes': movies.map((e) => e.toJson).toList(),
      }
    });
  }
}
