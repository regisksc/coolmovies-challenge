import 'package:flutter/rendering.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_helpers/mock_objects.dart';

void main() {
  test(
    "test toJson",
    () async {
      // Arrange
      final model = mockMovieModel();
      // Act
      final json = model.toJson;
      // Assert
      expect(
        json,
        equals(
          {
            "id": model.id,
            "imgUrl": model.imgUrl,
            "title": model.title,
            "releaseDate": model.releaseDate,
            "movieDirectorByMovieDirectorId": {"name": model.directorName},
            "movieReviewsByMovieId": {
              "nodes": model.reviews.map((e) => e.toJson).toList()
            },
            "description": model.description,
          },
        ),
      );
    },
  );
  test(
    "formattedReleaseDate",
    () async {
      // Arrange
      final model = mockMovieModel();
      final year = model.releaseDate!.split("-")[0];
      final day = model.releaseDate!.split("-")[2];

      final isSt = day == "1" || day == "21";
      final isNd = day == "2" || day == "22";
      final isRd = day == "3" || day == "23";
      final isTh = !isSt && !isNd && !isRd;
      // Act
      final date = model.formattedReleaseDate;
      debugPrint(day);
      debugPrint(date);
      // Assert
      expect(date, contains(year));
      expect(date, contains(day));
      if (isTh) expect(date.contains('th'), isTrue);
      if (isSt) expect(date.contains('st'), isTrue);
      if (isNd) expect(date.contains('nd'), isTrue);
      if (isRd) expect(date.contains('rd'), isTrue);
    },
  );

  test(
    "movie rating",
    () async {
      // Arrange
      final model = mockMovieModel();
      final reviewRatings = model.reviews.map((e) => e.rating).toList();
      final manualAverageRating =
          reviewRatings.reduce((a, b) => a + b) / reviewRatings.length;
      final roundedAverage =
          double.parse(manualAverageRating.toStringAsFixed(1));
      // Act
      final averageRating = model.rating;
      // Assert
      expect(averageRating, equals(roundedAverage));
    },
  );
  test(
    "movie release year",
    () async {
      // Arrange
      final model = mockMovieModel();
      final manualReleaseYear = model.releaseDate?.split('-').first ?? "";
      // Act
      final year = model.releaseYear;
      // Assert
      expect(year, equals(manualReleaseYear));
    },
  );

  test(
    "movie release year should be empty when release date is empty",
    () async {
      // Arrange
      final model = mockMovieModel(makeReleaseDateNull: true);
      // Act
      final year = model.releaseYear;
      // Assert
      expect(year, equals(""));
    },
  );
}
