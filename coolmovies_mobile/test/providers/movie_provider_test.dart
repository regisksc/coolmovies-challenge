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

  test(
    "should replace review on edit save action",
    () async {
      // Arrange
      when(repository.storeMovies(any)).thenAnswer((_) => Future.value());
      final movies = mockMovieList();
      final reviewToBeEdited = movies[0].reviews[0];
      final firstTitle = reviewToBeEdited.title;
      // Act
      sut.startEditingReview(reviewToBeEdited);
      reviewToBeEdited.title = 'newTitle';
      sut.stopEditingReview(reviewToBeEdited, save: true);
      final newTitle = reviewToBeEdited.title;
      // Assert
      verify(repository.storeMovies(any));
      expect(newTitle, isNot(firstTitle));
    },
  );

  test(
    "should not replace review on edit cancel action",
    () async {
      // Arrange
      final movies = mockMovieList();
      final reviewToBeEdited = movies[0].reviews[0];
      final titleBefore = reviewToBeEdited.title;
      // Act
      sut.startEditingReview(reviewToBeEdited);
      reviewToBeEdited.title = 'newTitle';
      sut.stopEditingReview(reviewToBeEdited);
      final titleAfter = reviewToBeEdited.title;
      // Assert
      verifyNever(repository.storeMovies(any));
      expect(titleBefore, equals(titleAfter));
    },
  );
}
