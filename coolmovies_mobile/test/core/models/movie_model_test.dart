import 'package:coolmovies/core/models/models.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test(
    "test toJson",
    () async {
      // Arrange
      final model = MovieModel(
        title: 'Movie',
        id: 'any',
        imgUrl: 'any',
        releaseDate: 'any',
      );
      // Act
      final json = model.toJson;
      // Assert
      expect(
        json,
        equals(
          {
            'title': 'Movie',
            'id': 'any',
            'imgUrl': 'any',
            'releaseDate': 'any',
          },
        ),
      );
    },
  );
}
