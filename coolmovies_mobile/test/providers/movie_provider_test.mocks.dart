// Mocks generated by Mockito 5.3.0 from annotations
// in coolmovies/test/providers/movie_provider_test.dart.
// Do not manually edit this file.

// ignore_for_file: no_leading_underscores_for_library_prefixes
import 'dart:async' as _i4;

import 'package:coolmovies/core/core.dart' as _i5;
import 'package:coolmovies/repositories/movie/movie_repository.dart' as _i3;
import 'package:either_dart/either.dart' as _i2;
import 'package:mockito/mockito.dart' as _i1;

// ignore_for_file: type=lint
// ignore_for_file: avoid_redundant_argument_values
// ignore_for_file: avoid_setters_without_getters
// ignore_for_file: comment_references
// ignore_for_file: implementation_imports
// ignore_for_file: invalid_use_of_visible_for_testing_member
// ignore_for_file: prefer_const_constructors
// ignore_for_file: unnecessary_parenthesis
// ignore_for_file: camel_case_types
// ignore_for_file: subtype_of_sealed_class

class _FakeEither_0<L, R> extends _i1.SmartFake implements _i2.Either<L, R> {
  _FakeEither_0(Object parent, Invocation parentInvocation)
      : super(parent, parentInvocation);
}

/// A class which mocks [MovieRepository].
///
/// See the documentation for Mockito's code generation for more information.
class MockMovieRepository extends _i1.Mock implements _i3.MovieRepository {
  MockMovieRepository() {
    _i1.throwOnMissingStub(this);
  }

  @override
  _i4.Future<_i2.Either<_i5.Failure, List<_i5.MovieModel>>> getAllMovies() =>
      (super.noSuchMethod(Invocation.method(#getAllMovies, []),
          returnValue:
              _i4.Future<_i2.Either<_i5.Failure, List<_i5.MovieModel>>>.value(
                  _FakeEither_0<_i5.Failure, List<_i5.MovieModel>>(
                      this, Invocation.method(#getAllMovies, [])))) as _i4
          .Future<_i2.Either<_i5.Failure, List<_i5.MovieModel>>>);
  @override
  _i4.Future<dynamic> storeMovies(List<_i5.MovieModel>? movies) =>
      (super.noSuchMethod(Invocation.method(#storeMovies, [movies]),
          returnValue: _i4.Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> remoteAddReview(
          {String? movieId, String? userId, _i5.MovieReviewModel? review}) =>
      (super.noSuchMethod(
          Invocation.method(#remoteAddReview, [],
              {#movieId: movieId, #userId: userId, #review: review}),
          returnValue: _i4.Future<dynamic>.value()) as _i4.Future<dynamic>);
  @override
  _i4.Future<dynamic> remoteEditReview(
          {String? movieId, String? userId, _i5.MovieReviewModel? review}) =>
      (super.noSuchMethod(
          Invocation.method(#remoteEditReview, [],
              {#movieId: movieId, #userId: userId, #review: review}),
          returnValue: _i4.Future<dynamic>.value()) as _i4.Future<dynamic>);
}
