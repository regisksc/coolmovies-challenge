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

    final hasErrors = result.data?.containsKey('errors') ?? true;
    final hasException = result.hasException || result.data == null;
    if (hasErrors || hasException) {
      debugPrint("Exception occured : \n${result.exception.toString()}");
      final error = result.data?['errors'][0];
      final message = error?['message'].toString();
      return Left(GQLRequestFailure(
          message ?? resultDataNullStringFor(query: 'getAllMovies')));
    }

    final mapList = result.data!['allMovies']["nodes"] as List;
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
