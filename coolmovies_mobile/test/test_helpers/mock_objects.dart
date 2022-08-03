import 'package:coolmovies/core/core.dart';
import 'package:faker/faker.dart';

UserModel get mockUserModel => UserModel(
      id: faker.guid.guid(),
      name: faker.person.name(),
      comments: List<MovieReviewCommentModel>.generate(
          3, (_) => mockMovieReviewCommentModel),
    );

MovieModel get mockMovieModel => MovieModel(
      title: faker.lorem.words(3).join(" "),
      id: faker.guid.guid(),
      imgUrl:
          "https://upload.wikimedia.org/wikipedia/en/d/d4/Rogue_One%2C_A_Star_Wars_Story_poster.png",
      releaseDate: mockDate,
      createdBy: mockUserModel,
      directorName: faker.person.name(),
      reviews: List<MovieReviewModel>.generate(3, (_) => mockMovieReviewModel),
    );

MovieReviewCommentModel get mockMovieReviewCommentModel =>
    MovieReviewCommentModel(
      movieReviewId: faker.guid.guid(),
      id: faker.guid.guid(),
      title: faker.lorem.words(3).join(" "),
      body: faker.lorem.sentence(),
    );

MovieReviewModel get mockMovieReviewModel => MovieReviewModel(
      title: faker.lorem.words(3).join(" "),
      body: faker.lorem.sentence(),
      rating: double.parse(faker.randomGenerator.integer(5, min: 1).toString()),
      createdBy: mockUserModel,
    );

String get mockDate =>
    "${faker.date.year()}-${faker.date.month()}-${faker.date.random.integer(31, min: 1)}";
