class ActorModel {
  final int id;
  final String name;
  final String? profilePath;
  final String character;

  ActorModel({
    required this.id,
    required this.name,
    this.profilePath,
    required this.character,
  });

  factory ActorModel.fromJson(Map<String, dynamic> json) {
    return ActorModel(
      id: json['id'],
      name: json['name'],
      profilePath: json['profile_path'] == null
          ? ""
          : "https://image.tmdb.org/t/p/w500${json['profile_path']}",
      character: json['character'],
    );
  }
}
