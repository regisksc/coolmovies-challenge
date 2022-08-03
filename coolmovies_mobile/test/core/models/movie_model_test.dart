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
}
