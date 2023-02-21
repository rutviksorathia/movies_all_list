import 'package:movie/model/modelMovieList.dart';
import 'package:stacked/stacked.dart';

class MovieViewModel extends BaseViewModel {
  Movie? movies;

  MovieViewModel({this.movies});

  void fetchMovies() {}
}
