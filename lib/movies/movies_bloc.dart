import 'package:movies_flutter/movies/movie_api.dart';
import 'package:movies_flutter/utils/simple_bloc.dart';

class MoviesBloc extends SimpleBloc {

  Future fetch({bool isRefresh = false}) async {
    try {
      if(isRefresh) {
        add(null);
      }
      
      final movies = await MoviesApi.getMovies();

      add(movies);

      return movies;
    } catch(error) {
      addError("Nenhum filme encontrado!");
    }
  }

}