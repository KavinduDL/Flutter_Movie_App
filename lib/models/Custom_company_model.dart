class CompanyModel {
  String name;
  String logo;

  CompanyModel({required this.name, required this.logo});

  factory CompanyModel.fromJson(Map<String, dynamic> json) {
    return CompanyModel(
      name: json["name"] as String,
      logo: json["logo_path"] == null
          ? ""
          : {"https://api.themoviedb.org/3/movie/" + json["logo_path"]}
                as String,
    );
  }
}
