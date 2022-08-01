import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../core/core.dart';
import '../repositories.dart';

class ConcreteMovieRepository implements MovieRepository {
  ConcreteMovieRepository(this.client);
  final GraphQLClient client;

  @override
  Future<Either<Failure, List<MovieModel>>> getAllMovies() async {
    debugPrint('Query getAllMovies ...');

    final gqlDocNode = gql(GQLQueries.getAllMovies);
    final QueryResult result = await client.query(
      QueryOptions(document: gqlDocNode),
    );

    final hasError = result.data!.containsKey('errors') ||
        result.hasException ||
        result.data == null;
    if (hasError) {
      debugPrint("Exception occured : \n${result.exception.toString()}");
      final error = result.data!['errors'][0];
      final message = result.data == null
          ? resultDataNullStringFor(query: 'getAllMovies')
          : error['message'].toString();
      return Left(GQLRequestFailure(message));
    }

    final mapList = result.data!['data']['allMovies']["nodes"] as List;
    final modelList = mapList.map(
      (movieMap) {
        final map = movieMap as Map<String, dynamic>;
        final model = MovieModel.fromJson(map);
        return model;
      },
    ).toList();
    return Right(modelList);
  }
}
