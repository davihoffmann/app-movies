import 'package:movies_flutter/movies/movie.dart';
import 'package:movies_flutter/movies/movie_db.dart';
import 'package:movies_flutter/utils/simple_bloc.dart';

class FavoritosBloc extends SimpleBloc<List<Movie>> {

  Future fetch({bool isRefresh = false}) async {
    try {
      if(isRefresh) {
        add(null);
      }
      
      final db = MovieDB.getInstance();
      final movies = await db.getMovies();

      add(movies);

      return movies;
    } catch(error) {
      addError("Nenhum filme nos favoritos!");
    }
  }

}