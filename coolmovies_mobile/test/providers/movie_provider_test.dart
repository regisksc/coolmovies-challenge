import 'package:coolmovies/providers/movie_provider.dart';
import 'package:coolmovies/repositories/repositories.dart';
import 'package:either_dart/either.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mockito/annotations.dart';
import 'package:mockito/mockito.dart';

import '../test_helpers/mock_objects.dart';
import 'movie_provider_test.mocks.dart';

@GenerateMocks([MovieRepository])
void main() {
  late MoviesProvider sut;
  late MockMovieRepository repository;

  setUp(() {
    repository = MockMovieRepository();
    sut = MoviesProvider(repository);
  });

  test(
    "should update state when getMovies ends in success",
    () async {
      // Arrange
      final fromRepository = mockMovieList();
      when(repository.getAllMovies()).thenAnswer(
        (_) async => Right(fromRepository),
      );
      // Act
      sut.addListener(() {
        expect(sut.movies, isNotEmpty);
        expect(sut.movies, equals(fromRepository));
        expect(sut.movies.length, equals(fromRepository.length));
      });
      await sut.getMovies();
      // Assert
      verify(repository.getAllMovies());
    },
  );

  test(
    "should update last failure when getAllMovies fails",
    () async {
      // Arrange
      final failure = mockFailure;
      when(repository.getAllMovies()).thenAnswer(
        (_) async => Left(failure),
      );
      // Act
      sut.addListener(() {
        expect(sut.lastRequestFailure, isNotNull);
        expect(sut.lastRequestFailure, equals(failure));
      });
      await sut.getMovies();
      // Assert
      verify(repository.getAllMovies());
    },
  );
}
