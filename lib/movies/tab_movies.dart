import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/movies/movie.dart';
import 'package:movies_flutter/movies/movie_page.dart';
import 'package:movies_flutter/movies/movies_bloc.dart';
import 'package:movies_flutter/utils/nav.dart';
import 'package:movies_flutter/widgets/mensagem_erro.dart';

class TabMovies extends StatefulWidget {
  @override
  _TabMoviesState createState() => _TabMoviesState();
}

class _TabMoviesState extends State<TabMovies> with AutomaticKeepAliveClientMixin<TabMovies> {
  final bloc = BlocProvider.getBloc<MoviesBloc>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    return StreamBuilder(
      stream: bloc.stream,
      builder: (context, snapshot) {

        // Caso der erro
        if (snapshot.hasError) {
          return Center(
            child: MensagemErro(
              snapshot.error,
              onRefresh: _onRefreshError,
            ),
          );
        }

        // Caso nao tenha recebido os dados ainda
        if (!snapshot.hasData) {
          return Center(
            child: CircularProgressIndicator(),
          );
        }

        List<Movie> movies = snapshot.data;
        return movies.isNotEmpty
            ? _gridView(movies)
            : MensagemErro("Nenhum filme.");
      },
    );
  }

  Widget _gridView(List<Movie> movies) {
    return RefreshIndicator(
      onRefresh: _onRefresh,
      child: GridView.builder(
        gridDelegate:
            SliverGridDelegateWithFixedCrossAxisCount(crossAxisCount: 2),
        itemCount: movies.length,
        itemBuilder: (context, index) {
          return _item(movies, index, context);
        },
      ),
    );
  }

  Material _item(List<Movie> movies, int index, BuildContext context) {
    Movie movie = movies[index];
    return Material(
      child: InkWell(
        child: Hero(
          tag: movie.title,
          child: Image.network(movie.urlFoto, fit: BoxFit.cover),
        ),
        onTap: () => _onClickMovie(movie),
      ),
    );
  }

  _onClickMovie(Movie movie) {
    push(context, MoviePage(movie));
  }

  Future<void> _onRefresh() {
    return bloc.fetch();
  }

  _onRefreshError() {
    return bloc.fetch(isRefresh: true);
  }

}
