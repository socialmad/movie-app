class MovieDetailsModel {
  String backdropPath;
  int id;
  String originalTitle;
  String overview;

  MovieDetailsModel(
      {required this.backdropPath,
      required this.id,
      required this.originalTitle,
      required this.overview});

  factory MovieDetailsModel.fromMap(Map<String, dynamic> json) =>
      MovieDetailsModel(
          backdropPath: json['backdrop_path'],
          id: json['id'],
          originalTitle: json['original_title'],
          overview: json['overview']);
}

class Genres {
  int id;
  String name;

  Genres({required this.id, required this.name});

  factory Genres.fromMap(Map<String, dynamic> json) =>
      Genres(id: json['id'], name: json['name']);
}
