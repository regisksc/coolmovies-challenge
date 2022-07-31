// ignore_for_file: unnecessary_string_escapes, leading_newlines_in_multiline_strings

class GQLQueries {
  GQLQueries._();

  static String get getAllMovies => """
          query AllMovies {
            allMovies {
              nodes {
                id
                imgUrl
                movieDirectorId
                userCreatorId
                title
                releaseDate
                nodeId
                userByUserCreatorId {
                  id
                  name
                  nodeId
                }
              }
            }
          }
        """;

  // ##

  static String get getAllMovieReviews {
    return """
      query {
        allMovieReviews {
          nodes {
            title
            body
            rating
            movieByMovieId {
              id
              title
              userByUserCreatorId {
                id
                name
              }
            }
            commentsByMovieReviewId {
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
      }""";
  }

  // ##

  static String getReview({required String id}) {
    return """
      query {
        movieReviewById(id: \"$id\") {
          body
          id
          movieByMovieId {
            id
            releaseDate
            title
            movieDirectorByMovieDirectorId {
              age
              id
              name
            }
          }
          rating
          nodeId
          title
          userByUserReviewerId {
            name
            id
          }
        }
      } """;
  }

  // ##

  static String getReviews({required String movieId}) {
    return """ 
      allMovieReviews(
        filter: {movieId: {equalTo: \"$movieId\"}}
      ) {
        nodes {
          title
          body
          rating
          movieByMovieId {
            title
          }
        }
      }
    """;
  }

  // ##

  static String getUsers({int page = 1}) {
    late final int offset;
    if (page == 1) offset = 0;
    if (page != 1) offset = 3 * page;
    return """
      allUsers(first: 3, offset: $offset) {
          nodes {
            id
            name
          }
          pageInfo {
            hasNextPage
            hasPreviousPage
          }
        }
  """;
  }

  // ##

  static String get getCurrentUser {
    return """
      currentUser {
        id
        name
      }
  """;
  }

  // ##

  static String createComment({required Map<String, dynamic> commentMap}) {
    return """"
      createComment(input: {comment: $commentMap}) {
          comment {
            id
            title
            body
            userByUserId {
              id
              name
            }
            movieReviewByMovieReviewId {
              id
              title
              movieByMovieId {
                title
              }
            }
          }
        }
  """;
  }

  // ##

  static String createMovieReview({
    required Map<String, dynamic> movieReviewMap,
  }) {
    return """"
      createMovieReview(input: {
      movieReview: $movieReviewMap})
    {
      movieReview {
        id
        title
        body
        rating
        movieByMovieId {
          title
        }
        userByUserReviewerId {
          name
        }
      }
    }
  """;
  }

  // ##

  static String createUser({
    required Map<String, dynamic> userMap,
  }) {
    return """"
      createUser(input: {user: $userMap}) {
        user {
          id
          name
        }
      }
  """;
  }
}
