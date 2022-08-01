import 'dart:convert';

import 'package:coolmovies/core/core.dart';
import 'package:coolmovies/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../fixtures/fixture_reader.dart';
@GenerateMocks([GraphQLClient])
import 'concrete_movie_repository_test.mocks.dart';

void main() {
  late MovieRepository sut;
  late MockGraphQLClient client;
  late Map<String, dynamic> mockSuccessResponse;

  setUp(
    () {
      client = MockGraphQLClient();
      sut = ConcreteMovieRepository(client);

      mockSuccessResponse =
          jsonDecode(fixture('get_all_movies.json')) as Map<String, dynamic>;
    },
  );

  test(
    "getAllMovies should return a List<MovieModel> on success",
    () async {
      // Arrange
      final queryOptions =
          QueryOptions(document: gql(GQLQueries.getAllMovieReviews));
      when(client.query(queryOptions)).thenAnswer((_) async => QueryResult(
          options: queryOptions, source: QueryResultSource.network));
      // Act
      final result = await sut.getAllMovies();
      // Assert
      expect(result, isA<List<MovieModel>>());
    },
  );
}
