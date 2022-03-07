class UpcomingMovieModel {
  int id;
  String originalTitle;
  String backdropPath;

  UpcomingMovieModel(
      {required this.id,
      required this.originalTitle,
      required this.backdropPath});

  factory UpcomingMovieModel.fromMap(Map<String, dynamic> json) =>
      UpcomingMovieModel(
          id: json['id'],
          originalTitle: json['original_title'],
          backdropPath: json['backdrop_path']);
}
