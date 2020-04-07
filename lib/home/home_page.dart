import 'package:bloc_pattern/bloc_pattern.dart';
import 'package:flutter/material.dart';
import 'package:movies_flutter/favoritos/favoritos_bloc.dart';
import 'package:movies_flutter/favoritos/tab_favoritos.dart';
import 'package:movies_flutter/home/drawer_menu.dart';
import 'package:movies_flutter/movies/movies_bloc.dart';
import 'package:movies_flutter/movies/tab_movies.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
    with SingleTickerProviderStateMixin<HomePage> {
  TabController tabController;

  @override
  void initState() {
    super.initState();

    tabController = TabController(length: 2, vsync: this);
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      blocs: [
        Bloc((i) => MoviesBloc()),
        Bloc((i) => FavoritosBloc()),
      ],
      child: Scaffold(
        appBar: AppBar(
          title: Text("Movies App"),
          actions: <Widget>[
            IconButton(icon: Icon(Icons.exit_to_app), onPressed: _onClickLogout)
          ],
          bottom: TabBar(
            controller: tabController,
            tabs: [
              Tab(
                text: "Filmes",
              ),
              Tab(
                text: "Favoritos",
              )
            ],
          ),
        ),
        body: TabBarView(
            controller: tabController, children: [TabMovies(), TabFavoritos()]),
        drawer: DrawerMenu(),
      ),
    );
  }

  void _onClickLogout() {}
}
