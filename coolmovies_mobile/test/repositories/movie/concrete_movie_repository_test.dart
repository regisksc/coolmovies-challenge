import 'package:coolmovies/core/core.dart';
import 'package:coolmovies/repositories/repositories.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_helpers/mock_success_for_fixture.dart';
@GenerateMocks([GraphQLClient])
import 'concrete_movie_repository_test.mocks.dart';

void main() {
  late MovieRepository sut;
  late MockGraphQLClient client;

  setUp(
    () {
      client = MockGraphQLClient();
      sut = ConcreteMovieRepository(client);
    },
  );

  test(
    "getAllMovies should return a List<MovieModel> on success",
    () async {
      // Arrange
      final gqlDocNode = gql(GQLQueries.getAllMovieReviews);
      final queryOptions = QueryOptions(document: gqlDocNode);
      when(client.query(any)).thenAnswer(
        (_) async => QueryResult(
          options: queryOptions,
          source: QueryResultSource.network,
          data: mockSuccessForFixture('get_all_movies.json'),
        ),
      );
      // Act
      final result = await sut.getAllMovies();
      final extract = result.fold((failure) => failure, (success) => success);
      // Assert
      verify(client.query(any));
      expect(extract, isA<List<MovieModel>>());
    },
  );

  test(
    "getAllMovies should return a GQLRequestFailure with message on failure when result has exception",
    () async {
      // Arrange
      final gqlDocNode = gql(GQLQueries.getAllMovieReviews);
      final queryOptions = QueryOptions(document: gqlDocNode);
      when(client.query(any)).thenAnswer(
        (_) async => QueryResult(
          options: queryOptions,
          source: QueryResultSource.network,
          data: mockGraphQLRequestFailure(),
        ),
      );
      // Act
      final result = await sut.getAllMovies();
      final extract = result.fold((failure) => failure, (success) => success);
      // Assert
      verify(client.query(any));
      expect(extract, isA<GQLRequestFailure>());
    },
  );
}
