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

  void update() => notifyListeners();

  void stopEditingReview(
    MovieReviewModel review, {
    bool save = false,
  }) {
    review.isInEditState = false;
    save ? _repository.storeMovies(movies) : review.discardChanges();
    review.reviewBackup = null;
    notifyListeners();
  }

  void resetEditState(MovieModel movie) {
    if (!movie.reviews.any((review) => review.isInEditState)) return;
    movie.reviews..forEach((review) => review.isInEditState = false);
  }

  void addReview({
    required MovieModel movie,
    required UserModel user,
  }) {
    final newReview = MovieReviewModel(
      movieId: movie.id,
      id: "",
      title: "",
      body: "",
      rating: 5,
      createdBy: user,
    );
    newReview.isInEditState = true;
    movie.reviews.insert(0, newReview);
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
