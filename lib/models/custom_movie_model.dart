class MovieModel {
  String title;
  String posterPath;
  String backdropPath;
  int id;
  String releaseDate;
  double voteAverage;

  MovieModel({
    required this.title,
    required this.posterPath,
    required this.backdropPath,
    required this.id,
    required this.releaseDate,
    required this.voteAverage,
  });

  factory MovieModel.fromJson(Map<String, dynamic> json) {
    return MovieModel(
      title: json["title"],
      posterPath: "https://image.tmdb.org/t/p/w500${json["poster_path"]}",
      backdropPath: "https://image.tmdb.org/t/p/w500${json["backdrop_path"]}",
      id: json["id"],
      releaseDate: json["release_date"],
      voteAverage: json["vote_average"],
    );
  }
}
