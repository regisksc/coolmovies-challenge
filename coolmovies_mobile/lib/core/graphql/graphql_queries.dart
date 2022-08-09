// ignore_for_file: unnecessary_string_escapes, leading_newlines_in_multiline_strings

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
									totalCount
									nodes {
										id
                    movieId
										body
										title
										rating
										userByUserReviewerId {
											id
											name
											commentsByUserId {
												totalCount
												nodes {
													id
													userId
													body
													title
												}
											}
										}
									}
								}
                userByUserCreatorId {
                  id
                  name
									commentsByUserId {
										nodes {
											movieReviewId
											id
											title
											body
											
										}
									}
                }
              }
						}
}
        """;

  // ##

  static String getReviewsForMovieId(
    String movieId, {
    required int page,
  }) {
    return """ {
  allMovieReviews(
		first: 3, offset: $page
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
					commentsByUserId {
										nodes {
											movieReviewId
											id
											title
											body
											
										}
									}
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
		commentsByUserId {
			nodes {
				id
          title
          body
          userByUserId {
            id
            name
          }
			}
		}
  }
      }
  """;
  }
}
