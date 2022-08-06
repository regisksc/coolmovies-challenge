import 'package:coolmovies/core/core.dart';
import 'package:coolmovies/repositories/user/user.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:graphql_flutter/graphql_flutter.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../../test_helpers/mock_success_for_fixture.dart';
@GenerateMocks([GraphQLClient, AdaptedFlutterSecureStorage])
import 'concrete_user_repository_test.mocks.dart';

void main() {
  late UserRepository sut;
  late MockGraphQLClient client;
  late MockAdaptedFlutterSecureStorage storage;

  setUpAll(() {
    TestWidgetsFlutterBinding.ensureInitialized();
  });

  setUp(
    () {
      client = MockGraphQLClient();
      storage = MockAdaptedFlutterSecureStorage();
      sut = ConcreteUserRepository(client, storage);
    },
  );

  test(
    "getCurrentUser should return a UserModel on success",
    () async {
      // Arrange
      arrangeCommonExecutions(
        client,
        resultData: mockSuccessForFixture('current_user.json'),
      );
      when(storage.write(any, any)).thenAnswer(
        (_) async => Future.value(),
      );
      // Act
      final result = await sut.getCurrentUser();
      final extract = result.fold((failure) => failure, (success) => success);
      // Assert
      verify(client.query(any));
      expect(extract, isA<UserModel>());
    },
  );

  test(
    "getCurrentUser should store returned UserModel on success",
    () async {
      // Arrange
      arrangeCommonExecutions(
        client,
        resultData: mockSuccessForFixture('current_user.json'),
      );
      when(storage.write(any, any)).thenAnswer(
        (_) async => Future.value(),
      );
      // Act
      await sut.getCurrentUser();
      // Assert
      verify(storage.write(any, any));
    },
  );

  test(
    "getCurrentUser should return a GQLRequestFailure on failure when result has exception",
    () async {
      // Arrange
      arrangeCommonExecutions(client, resultData: mockGraphQLRequestFailure());
      when(storage.read(any)).thenAnswer(
        (_) async => {},
      );
      // Act
      final result = await sut.getCurrentUser();
      final extract = result.fold((failure) => failure, (success) => success);
      // Assert
      verify(client.query(any));
      expect(extract, isA<GQLRequestFailure>());
    },
  );
  test(
    "getCurrentUser should return a GQLRequestFailure with stored values if they exist",
    () async {
      // Arrange
      arrangeCommonExecutions(client, resultData: mockGraphQLRequestFailure());
      when(storage.read(any)).thenAnswer(
        (_) async => mockSuccessForFixture('current_user.json'),
      );
      // Act
      final result = await sut.getCurrentUser();
      final extract = result.fold((failure) => failure, (success) => success);
      extract as GQLRequestFailure;
      // Assert
      verify(storage.read(any));
    },
  );

  test(
    "getCurrentUser should return a GQLRequestFailure without stored values if they don't exist",
    () async {
      // Arrange
      arrangeCommonExecutions(client, resultData: mockGraphQLRequestFailure());
      when(storage.read(any)).thenAnswer(
        (_) async => {},
      );
      // Act
      final result = await sut.getCurrentUser();
      final extract = result.fold((failure) => failure, (success) => success);
      extract as GQLRequestFailure;
      // Assert
      verify(storage.read(any));
      expect(extract.valuesFromStorage, isNull);
    },
  );
}

void arrangeCommonExecutions(MockGraphQLClient client,
    {required JSON resultData}) {
  final gqlDocNode = gql(GQLQueries.getAllMovieReviews);
  final queryOptions = QueryOptions(document: gqlDocNode);
  when(client.query(any)).thenAnswer(
    (_) async => QueryResult(
      options: queryOptions,
      source: QueryResultSource.network,
      data: resultData,
    ),
  );
}
