import 'package:flutter_test/flutter_test.dart';

import '../../test_helpers/mock_objects.dart';

void main() {
  test(
    "test toJson",
    () async {
      // Arrange
      final model = mockMovieModel;
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
            "movieReviewsByMovieId": {"nodes": model.reviews},
            "userByUserCreatorId": model.createdBy,
          },
        ),
      );
    },
  );
  test(
    "test formattedReleaseDate",
    () async {
      // Arrange
      final model = mockMovieModel;
      final year = model.releaseDate!.split("-")[0];
      final day = model.releaseDate!.split("-")[2];
      // Act
      final date = model.formattedReleaseDate;
      // Assert
      expect(date, contains(year));
      expect(date, contains(day));
    },
  );
}
