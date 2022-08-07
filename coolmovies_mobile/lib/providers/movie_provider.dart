import '../core/core.dart';
import '../repositories/repositories.dart';
import 'providers.dart';

class MoviesProvider extends DefaultProvider {
  MoviesProvider(MovieRepository repository) : _repository = repository;

  final _movies = <MovieModel>[];

  List<MovieModel> get movies => _movies;

  final MovieRepository _repository;

  void startEditingReview(MovieReviewModel review) {
    review.reviewBackup = review.copy;
    if (!review.isInEditState) {
      review.isInEditState = true;
      notifyListeners();
    }
  }

  void stopEditingReview(
    MovieReviewModel review, {
    bool save = false,
  }) {
    review.isInEditState = false;
    if (save == false) {
      _revertReviewChanges(review);
    } else {}
    // TODO: implement storage data update
    review.reviewBackup = null;
    notifyListeners();
  }

  void _revertReviewChanges(MovieReviewModel review) {
    final thisReviewsMovie = movies.firstWhere(
      (movie) => movie.id == review.movieId,
    );
    final thisReviewsIndex = thisReviewsMovie.reviews.indexOf(review);
    final reviewBackup = review.reviewBackup;
    thisReviewsMovie.reviews.removeAt(thisReviewsIndex);
    thisReviewsMovie.reviews.insert(thisReviewsIndex, reviewBackup!);
  }

  Future getMovies() async {
    lastRequestFailure = null;
    final moviesOrError = await _repository.getAllMovies();
    moviesOrError.fold(
      (failure) => lastRequestFailure = failure,
      (movies) => _movies.addAll(movies),
    );
    notifyListeners();
  }
}
