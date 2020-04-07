import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:movies_flutter/favoritos/favoritos_bloc.dart';
import 'package:movies_flutter/movies/movie.dart';
import 'package:movies_flutter/movies/movie_db.dart';
import 'package:movies_flutter/utils/simple_bloc.dart';

class MovieBloc extends SimpleBloc<bool> {

  Future<bool> fetchFavorito(Movie movie) async {
    final db = MovieDB.getInstance();
    final b = await db.exists(movie);
    add(b);

    return b;
  }

  Future<bool> favoritar(Movie movie) async {
    final db = MovieDB.getInstance();
    final exists = await db.exists(movie);

    try {
      if(exists) {
        await db.deleteMovie(movie);
        add(false);
        return false;
      } else {
        await db.saveMovie(movie);
        add(true);
        return true;
      }
    } finally {
      final bloc = BlocProvider.getBloc<FavoritosBloc>();
      bloc.fetch();
    }

  }

}