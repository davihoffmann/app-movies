import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/favoritos/favoritos_bloc.dart';
import 'package:movies_flutter/movies/movie.dart';
import 'package:movies_flutter/movies/movie_page.dart';
import 'package:movies_flutter/utils/nav.dart';
import 'package:movies_flutter/widgets/mensagem_erro.dart';

class TabFavoritos extends StatefulWidget {
  @override
  _TabFavoritosState createState() => _TabFavoritosState();
}

class _TabFavoritosState extends State<TabFavoritos> with AutomaticKeepAliveClientMixin<TabFavoritos> {
  final bloc = BlocProvider.getBloc<FavoritosBloc>();

  @override
  bool get wantKeepAlive => true;

  @override
  void initState() {
    super.initState();

    bloc.fetch();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

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

    movie.tag = movie.title + "-fav";

    return Material(
      child: InkWell(
        child: Hero(
          tag: movie.tag,
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
