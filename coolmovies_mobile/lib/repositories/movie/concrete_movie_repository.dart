import 'dart:convert';

import 'package:either_dart/either.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:graphql_flutter/graphql_flutter.dart';

import '../../core/core.dart';
import '../repositories.dart';

class ConcreteMovieRepository implements MovieRepository {
  ConcreteMovieRepository(
    this.client,
    this.storage,
  );
  final GraphQLClient client;
  final FlutterSecureStorage storage;

  @override
  Future<Either<Failure, List<MovieModel>>> getAllMovies() async {
    debugPrint('Query getAllMovies ...');

    final gqlDocNode = gql(GQLQueries.getAllMovies);
    const storageKey = "GQLQueries.getAllMovies";
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
    final storedValuesString = await storage.read(key: storageKey);
    Map<String, dynamic>? storedValues;
    if (storedValuesString?.isNotEmpty ?? false) {
      storedValues = jsonDecode(storedValuesString!) as Map<String, dynamic>;
    }

    final cachedModels = <MovieModel>[];
    if (storedValues?.isNotEmpty ?? false) {
      final modelsMapList = storedValues!["movies"] as List;
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
    final mapList = result.data!['allMovies']["nodes"] as List;
    // save storage
    await storage.write(
        key: storageKey, value: jsonEncode({"movies": mapList}));
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
