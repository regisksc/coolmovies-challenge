import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
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

  @override
  Future<Either<Failure, List<MovieModel>>> getAllMovies() async {
    debugPrint('Query getAllMovies ...');

    final gqlDocNode = gql(GQLQueries.getAllMovies);
    const storageKey = "allMovies";
    final QueryResult result = await client.query(
      QueryOptions(document: gqlDocNode),
    );

    final hasErrors = result.data?.containsKey('errors') ?? true;
    final hasException = result.hasException || result.data == null;
    if (hasErrors || hasException) return handleFailure(result, storageKey);
    return handleSuccess(result, storageKey);
  }

  Future<Left<Failure, List<MovieModel>>> handleFailure(
    QueryResult<Object?> result,
    String storageKey,
  ) async {
    debugPrint("Exception occured : \n${result.exception.toString()}");
    final error = result.data?['errors'][0];
    final message = error?['message'].toString();
    final storedValues = await storage.read(storageKey);
    final cachedModels = <MovieModel>[];

    if (storedValues.isNotEmpty) {
      final modelsMapList = storedValues["allMovies"] as List;
      cachedModels
        ..addAll(modelsMapList
            .map((e) => MovieModel.fromJson(e as Map<String, dynamic>))
            .toList());
    }
    return Left(
      GQLRequestFailure(
        message ?? resultDataNullStringFor(query: 'getAllMovies'),
        valuesFromStorage: cachedModels,
      ),
    );
  }

  Future<Right<Failure, List<MovieModel>>> handleSuccess(
    QueryResult<Object?> result,
    String storageKey,
  ) async {
    final mapList = result.data![storageKey]["nodes"] as List;
    // save storage
    await storage.write(storageKey, jsonEncode({"movies": mapList}));
    // map result
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
