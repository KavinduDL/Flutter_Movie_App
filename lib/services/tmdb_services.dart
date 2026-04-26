import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:new_movie_app/models/custom_movie_model.dart';

import '../models/custom_actor_model.dart';

class MoiveServices {
  final String baseurl = "https://api.themoviedb.org/3/movie/";
  final String apikey = "e16d138611c55865ab26a0d5a1fb185c";

  Future<List<MovieModel>> getNowPlayingMovies() async {
    var getNowMovieEndpoint = baseurl + "now_playing?api_key=" + apikey;

    final response = await http.get(Uri.parse(getNowMovieEndpoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      List<MovieModel> movies = results
          .map(
            (movieData) =>
                MovieModel.fromJson(movieData as Map<String, dynamic>),
          )
          .toList();
      return movies;
    } else {
      throw Exception("Faild to Load Movies");
    }
  }

  Future<List<MovieModel>> getPopularMovies() async {
    var getPopularMoviesEndpoint = baseurl + "popular?api_key=" + apikey;

    final response = await http.get(Uri.parse(getPopularMoviesEndpoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      List<MovieModel> movies = results
          .map(
            (movieData) =>
                MovieModel.fromJson(movieData as Map<String, dynamic>),
          )
          .toList();
      return movies;
    } else {
      throw Exception("Faild to Load Movies");
    }
  }

  Future<List<MovieModel>> getTopRatedMovies() async {
    var getTopRatedMoviesEndpoint = baseurl + "top_rated?api_key=" + apikey;

    final response = await http.get(Uri.parse(getTopRatedMoviesEndpoint));
    if (response.statusCode == 200) {
      Map<String, dynamic> body = jsonDecode(response.body);
      List<dynamic> results = body["results"];
      List<MovieModel> movies = results
          .map(
            (movieData) =>
                MovieModel.fromJson(movieData as Map<String, dynamic>),
          )
          .toList();
      return movies;
    } else {
      throw Exception("Faild to load Movies");
    }
  }

  Future<MovieModel> getMovieDetailsById(MovieModel movieModel) async {
    final endpoint = baseurl + "${movieModel.id}?api_key=" + apikey;
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final movieData = jsonDecode(response.body);
      MovieModel movie = MovieModel.fromJson(movieData);
      return movie;
    } else {
      throw Exception("Faild to Load Movie");
    }
  }

  Future<List<ActorModel>> getCredit(String movieid) async {
    final endpoint = baseurl + "${movieid}/credits?api_key=" + apikey;
    final response = await http.get(Uri.parse(endpoint));
    if (response.statusCode == 200) {
      final movieData = jsonDecode(response.body);
      List<dynamic> cast = movieData["cast"];
      List<ActorModel> actors = cast
          .map(
            (actorData) =>
                ActorModel.fromJson(actorData as Map<String, dynamic>),
          )
          .toList();
      return actors;
    } else {
      throw Exception("Faild to Load Actor");
    }
  }
}
