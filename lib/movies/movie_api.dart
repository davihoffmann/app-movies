import 'dart:convert' as convert;

import 'package:movies_flutter/movies/api_key.dart';
import 'package:movies_flutter/movies/movie.dart';
import 'package:http/http.dart' as http;

class MoviesApi {

  static Future<List<Movie>> getMovies() async {
    
    final String url = "https://api.themoviedb.org/3/movie/popular?api_key=$api_key&language=pt-BR";
    
    final response = await http.get(url);

    print("GET > $url");

    String json = response.body;

    final map = convert.json.decode(json);
    final mapMovies = map["results"];

    List<Movie> movies = mapMovies.map<Movie>((json) => Movie.fromJson(json)).toList();

    return movies;
  }

}