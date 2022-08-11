// ignore_for_file: unnecessary_string_escapes, leading_newlines_in_multiline_strings

import '../core.dart';

class GQLQueries {
  GQLQueries._();

  static String get getAllMovies => """
           query AllMovies {
            allMovies {
              nodes {
                id
                imgUrl
                title
                releaseDate
								movieDirectorByMovieDirectorId {
									id
									name
								}
								movieReviewsByMovieId{
									nodes {
										id
										rating 
									} 
								}
              }
						}
}
        """;

  // ##

  static String getReviewsForMovieId(
    String movieId, {
    required int pageNum,
  }) {
    late final int offset;
    if (pageNum == 1) offset = 0;
    if (pageNum != 1) {
      offset = reviewsPerPage * pageNum;
    }
    return """ {
  allMovieReviews(
		first: $reviewsPerPage, offset: $offset
    filter: { movieId: {equalTo: "$movieId"}}
  ) {
    nodes {
				title
				body
				id
				rating
				title
        movieId
				userByUserReviewerId {
					name
					id
    	}
    }
  }
} """;
  }

  static String get getCurrentUser {
    return """
      query {
        currentUser {
    id
    name
  }
      }
  """;
  }
}
