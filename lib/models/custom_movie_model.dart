import 'Custom_company_model.dart';

class MovieModel {
  String title;
  String posterPath;
  String backdropPath;
  int id;
  String releaseDate;
  double voteAverage;
  String? overview;
  bool adult;
  List? genres;
  List<CompanyModel>? companies;

  MovieModel({
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.id,
    required this.releaseDate,
    required this.voteAverage,
    this.overview,
    required this.adult,
    this.genres,
    this.companies,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json["title"],
      posterPath: "https://image.tmdb.org/t/p/w500${json["poster_path"]}",
      backdropPath: "https://image.tmdb.org/t/p/w500${json["backdrop_path"]}",
      id: json["id"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
      overview: json["overview"],
      adult: json["adult"],
      genres: json["genres"] == null
          ? []
          : (json["genres"] as List<dynamic>)
                .map(
                  (element) =>
                      (element as Map<String, dynamic>)["name"] as String,
                )
                .toList(),
      companies: json["production_companies"] == null
          ? []
          : (json["production_companies"] as List<dynamic>)
                .map(
                  (element) =>
                      CompanyModel.fromJson(element as Map<String, dynamic>),
                )
                .toList(),
    );
  }
}
