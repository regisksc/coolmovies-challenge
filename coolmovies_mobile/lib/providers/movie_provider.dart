import '../core/core.dart';
import '../repositories/repositories.dart';
import 'providers.dart';

class MoviesProvider extends DefaultProvider {
  MoviesProvider(MovieRepository repository) : _repository = repository;

  final _movies = <MovieModel>[];

  List<MovieModel> get movies => _movies;

  final MovieRepository _repository;

  void startEditingReview(MovieReviewModel review) {
    review.backup();
    if (review.isInEditState == false) {
      review.isInEditState = true;
      notifyListeners();
    }
  }

  void stopEditingReview(
    MovieReviewModel review, {
    bool save = false,
  }) {
    review.isInEditState = false;
    save ? _repository.storeMovies(movies) : review.discardChanges();
    review.reviewBackup = null;
    notifyListeners();
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
