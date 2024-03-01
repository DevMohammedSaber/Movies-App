import 'package:movies_app/module/model/genre.dart';

class MovieModel {
  String? backdropPath;
  int? id;
  String? originalTitle;
  String? overview;
  String? posterPath;
  String? releaseDate;
  String? title;
  double? voteAverage;
  List<Genre>? genres;

  MovieModel({
    this.backdropPath,
    this.id,
    this.originalTitle,
    this.overview,
    this.posterPath,
    this.releaseDate,
    this.title,
    this.voteAverage,
    this.genres,
  });
  static MovieModel empety() => MovieModel(
        backdropPath: '',
        id: 0,
        originalTitle: '',
        overview: '',
        posterPath: '',
        releaseDate: '',
        title: '',
        voteAverage: 0.0,
        genres: [],
      );
  factory MovieModel.fromJson(Map<String, dynamic> json) => MovieModel(
        backdropPath: json['backdrop_path'] ?? '',
        id: json['id'] ?? 0,
        originalTitle: json['original_title'] ?? '',
        overview: json['overview'] ?? '',
        posterPath: json['poster_path'] ?? '',
        releaseDate: json['release_date'] ?? '',
        title: json['title'] ?? '',
        voteAverage: json['vote_average'] ?? 0.0,
        genres: (json['genres'] as List<dynamic>?)
                ?.map((e) => Genre.fromJson(e as Map<String, dynamic>))
                .toList() ??
            [],
      );
}
