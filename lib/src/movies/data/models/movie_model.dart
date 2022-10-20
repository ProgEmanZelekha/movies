import 'package:movies/src/movies/domain/entities/movie.dart';

class MovieModel extends Movie {
  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['title'] = title;
    map['backdrop_path'] = backdropPath;
    map['genre_ids'] = genreIds;
    map['overview'] = overview;
    map['release_date'] = releaseDate;
    map['vote_average'] = voteAverage;
    return map;
  }

  factory MovieModel.fromJson(Map<String, dynamic> json) =>
    MovieModel(
        id: json['id'],
        title: json['title'],
        backdropPath: json['backdrop_path'],
        genreIds: json['genre_ids'] != null ? json['genre_ids'].cast<num>() : [
        ],
        overview: json['overview'],
        releaseDate: json['release_date'],
        voteAverage: json['vote_average']
    );



  const MovieModel({required super.id,
    required super.title,
    required super.backdropPath,
    required super.genreIds,
    required super.overview,
    required super.releaseDate,
    required super.voteAverage});
}
