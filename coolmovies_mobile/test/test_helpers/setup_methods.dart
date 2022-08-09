import 'package:coolmovies/providers/providers.dart';
import 'package:mocktail/mocktail.dart';

import 'mock_objects.dart';

void setupListMovieScreenProviders(
    UserProvider userProvider, MoviesProvider moviesProvider) {
  when(() => userProvider.user).thenReturn(mockUserModel);
  when(() => moviesProvider.movies).thenReturn(mockMovieList());
  when(() => moviesProvider.getMovies()).thenAnswer((_) => Future.value());
  when(() => userProvider.getCurrentUser()).thenAnswer((_) => Future.value());
}
