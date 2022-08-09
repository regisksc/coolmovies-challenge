// ignore_for_file: unnecessary_string_escapes

import '../core.dart';

class GQLMutations {
  GQLMutations._();

  static String createComment({required JSON commentMap}) {
    return """
      mutation {
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
      }
  """;
  }

  // ##

  static String createMovieReview({
    required JSON movieReviewMap,
  }) {
    return """
      

mutation {
  createMovieReview(
    input: { 
      movieReview: {
        title: \"${movieReviewMap['title']}\",
        body: \"${movieReviewMap['body']}\",
        rating: \"${movieReviewMap['rating']}\",
        movieId: \"${movieReviewMap['movieId']}\",
        userReviewerId: \"${movieReviewMap['userReviewerId']}\"
      }}) {
    movieReview {
      id
      movieByMovieId {
        title
      }
      userByUserReviewerId {
        name
      }
    }
  }
}
  """;
  }

  // ##
// ##

  static String updateMovieReview({
    required JSON movieReviewMap,
  }) {
    return """
      
mutation {
	updateMovieReviewById (input: {
	id: \"${movieReviewMap['id']}\",movieReviewPatch: {title: \"${movieReviewMap['title']}\",
      body: \"${movieReviewMap['body']}\",
      rating: \"${movieReviewMap['rating']}\",
      movieId: \"${movieReviewMap['movieId']}\",
      userReviewerId: \"${movieReviewMap['userReviewerId']}\"
      
    }}) {

		movieReview {
			id
			movieId
			title
			body
			rating
			userReviewerId
		}
	}
}
  """;
  }

  // ##

  static String createUser({
    required JSON userMap,
  }) {
    return """
      mutation {
        createUser(input: {user: $userMap}) {
        user {
          id
          name
        }
      }
      }
  """;
  }
}
