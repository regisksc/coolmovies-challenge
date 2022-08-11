import 'package:coolmovies/core/models/models.dart';
import 'package:coolmovies/providers/movie_provider.dart';
import 'package:coolmovies/repositories/repositories.dart';
import 'package:either_dart/either.dart';
import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:mocktail/mocktail.dart';

import '../test_helpers/mock_objects.dart';

class MockMovieRepository extends Mock implements MovieRepository {}

void main() {
  late MoviesProvider sut;
  late MockMovieRepository repository;

  setUpAll(() {
    registerFallbackValue(mockMovieReviewModel);
  });

  setUp(() {
    repository = MockMovieRepository();
    sut = MoviesProvider(repository);
  });

  test(
    "should update state when getMovies ends in success",
    () async {
      // Arrange
      final fromRepository = mockMovieList();
      when(() => repository.getAllMovies()).thenAnswer(
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
      verify(() => repository.getAllMovies());
    },
  );

  test(
    "should update last failure when getAllMovies fails",
    () async {
      // Arrange
      final fromStorage = mockMovieList();
      final failure = mockFailureWith(fromStorage);
      when(() => repository.getAllMovies()).thenAnswer(
        (_) async => Left(failure),
      );
      // Act
      sut.addListener(() {
        expect(sut.lastRequestFailure, isNotNull);
        expect(sut.lastRequestFailure, equals(failure));
      });
      await sut.getMovies();
      // Assert
      verify(() => repository.getAllMovies());
    },
  );

  group('review context tests', () {
    test(
      "should get 3 reviews for a movie per request on success",
      () async {
        // Arrange
        final fromRepository =
            List<MovieReviewModel>.generate(3, (i) => mockMovieReviewModel);
        when(() =>
                repository.getMovieReviewsFor(any(), page: any(named: 'page')))
            .thenAnswer((_) async => Right(fromRepository));
        // Act
        final id = faker.guid.guid();
        await sut.getReviewsForMovieId(id);
        final models = sut.reviews;
        // Assert
        await Future.delayed(
          const Duration(milliseconds: 2011),
          () {
            verify(() =>
                repository.getMovieReviewsFor(any(), page: any(named: 'page')));
            expect(models[id]!.length, 3);
          },
        );
      },
    );

    test(
      "should replace review on edit save action",
      () async {
        // Arrange
        when(() => repository.storeMovies(any()))
            .thenAnswer((_) => Future.value());
        when(() => repository.remoteAddReview(
              movieId: any(named: 'movieId'),
              userId: any(named: 'userId'),
              review: any(named: 'review'),
            )).thenAnswer((_) => Future.value());
        when(() => repository.remoteEditReview(
              movieId: any(named: 'movieId'),
              userId: any(named: 'userId'),
              review: any(named: 'review'),
            )).thenAnswer((_) => Future.value());
        when(() => repository.storeMovies(any()))
            .thenAnswer((_) => Future.value());
        final review = mockMovieReviewModel;
        final user = mockUserModel;
        final reviewToBeEdited = review;
        final firstTitle = reviewToBeEdited.title;
        // Act
        sut.startEditingReview(reviewToBeEdited);
        reviewToBeEdited.title = 'newTitle';
        reviewToBeEdited.title = 'body';
        sut.stopEditingReview(user, reviewToBeEdited, shouldSave: true);
        final newTitle = reviewToBeEdited.title;
        // Assert
        verify(() => repository.storeMovies(any()));
        verify(() => repository.remoteEditReview(
              movieId: any(named: 'movieId'),
              userId: any(named: 'userId'),
              review: any(named: 'review'),
            ));
        expect(newTitle, isNot(firstTitle));
      },
    );

    test(
      "should not replace review on edit cancel action",
      () async {
        // Arrange
        final review = mockMovieReviewModel;
        final user = mockUserModel;
        final titleBefore = review.title;
        // Act
        sut.startEditingReview(review);
        review.title = 'newTitle';
        sut.stopEditingReview(user, review);
        final titleAfter = review.title;
        // Assert
        verifyNever(() => repository.storeMovies(any()));
        expect(titleBefore, equals(titleAfter));
      },
    );
  });
}
