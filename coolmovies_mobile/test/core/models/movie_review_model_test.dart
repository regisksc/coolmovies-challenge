import 'package:faker/faker.dart';
import 'package:flutter_test/flutter_test.dart';

import '../../test_helpers/mock_objects.dart';

void main() {
  test(
    "test toJson",
    () async {
      // Arrange
      final model = mockMovieReviewModel;
      // Act
      final json = model.toJson;
      // Assert
      expect(
        json,
        equals(
          {
            "body": model.body,
            "title": model.title,
            "rating": model.rating,
            "userByUserReviewerId": model.createdBy,
          },
        ),
      );
    },
  );
  test(
    "copyWith should generate an instance with new data",
    () async {
      // Arrange
      final model = mockMovieReviewModel;
      // Act
      final newModel = model.copyWith(
        body: 'newBody',
        rating: faker.randomGenerator.integer(5, min: 1),
        title: 'newTitle',
      );
      // Assert
      expect(model.id, equals(newModel.id));
      expect(model.createdBy, equals(newModel.createdBy));
      expect(model.body, isNot(newModel.body));
      expect(model.title, isNot(newModel.title));
      expect(model.rating, isNot(newModel.rating));
    },
  );
}
