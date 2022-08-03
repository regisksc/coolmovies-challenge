import '../core.dart';

class MovieModel {
  const MovieModel({
    required this.title,
    required this.id,
    required this.createdBy,
    this.reviews = const [],
    this.directorName,
    this.imgUrl,
    this.releaseDate,
  });
/* 
  {
					"id": "70351289-8756-4101-bf9a-37fc8c7a82cd",
					"imgUrl": "https://upload.wikimedia.org/wikipedia/en/d/d4/Rogue_One%2C_A_Star_Wars_Story_poster.png",
					"title": "Rogue One: A Star Wars Story",
					"releaseDate": "2016-12-16",
					"movieDirectorByMovieDirectorId": {
						"id": "c103cc08-ed39-4a3c-a1f3-0f431c07539e",
						"name": "Gareth Edwards"
					},
					"movieReviewsByMovieId": {
						"totalCount": 3,
						"nodes": [
							{
								"body": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
								"title": "Best Action Movie",
								"rating": 4,
								"userByUserReviewerId": {
									"id": "65549e6a-2389-42c5-909a-4475fdbb3e69",
									"name": "Ayla",
									"commentsByUserId": {
										"totalCount": 0,
										"nodes": []
									}
								}
							},
							{
								"body": "Lorem ipsum dolor sit amet, consectetur adipiscing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat. Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum.",
								"title": "One of the best",
								"rating": 5,
								"userByUserReviewerId": {
									"id": "5f1e6707-7c3a-4acd-b11f-fd96096abd5a",
									"name": "Chrono",
									"commentsByUserId": {
										"totalCount": 0,
										"nodes": []
									}
								}
							},
							{
								"body": "Lorem Ipsum Text",
								"title": "Test",
								"rating": 4,
								"userByUserReviewerId": {
									"id": "5f1e6707-7c3a-4acd-b11f-fd96096abd5a",
									"name": "Chrono",
									"commentsByUserId": {
										"totalCount": 0,
										"nodes": []
									}
								}
							}
						]
					},
					"userByUserCreatorId": {
						"id": "7b4c31df-04b3-452f-a9ee-e9f8836013cc",
						"name": "Marle"
					}
				} */

  factory MovieModel.fromJson(JSON json) {
    return MovieModel(
      title: json['title'] as String,
      id: json['id'] as String,
      createdBy: UserModel.fromJson(
        json['userByUserCreatorId'] as JSON,
      ),
      directorName: json['movieDirectorByMovieDirectorId']['name'] as String?,
      imgUrl: json['imgUrl'] as String?,
      releaseDate: json['releaseDate'] as String?,
      reviews: (json['movieReviewsByMovieId']['nodes'] as List)
          .map((e) => MovieReviewModel.fromJson(e as JSON))
          .toList(),
    );
  }

  final String id;
  final String title;
  final String? imgUrl;
  final String? releaseDate;
  final String? directorName;
  final List<MovieReviewModel> reviews;
  final UserModel createdBy;

  int get reviewCount => reviews.length;

  JSON get toJson {
    return {
      "id": id,
      "imgUrl": imgUrl,
      "title": title,
      "releaseDate": releaseDate,
      "movieDirectorByMovieDirectorId": {"name": directorName},
      "movieReviewsByMovieId": {"nodes": reviews},
      "userByUserCreatorId": createdBy
    };
  }
}
