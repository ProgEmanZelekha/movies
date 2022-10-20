import 'package:equatable/equatable.dart';

/// id : 0
/// title : ""
/// backdrop_path : ""
/// genre_ids : [1,1]
/// overview : ""
/// vote_average : 2.2

class Movie extends Equatable {
  const Movie({
    this.id,
    this.title,
    this.backdropPath,
    this.genreIds,
    this.overview,
    this.releaseDate,
    this.voteAverage,
  });

  final num? id;
  final String? title;
  final String? backdropPath;
  final List<num>? genreIds;
  final String? overview;
  final String? releaseDate;
  final num? voteAverage;

  @override
  // TODO: implement props
  List<Object?> get props =>
      [id, title, backdropPath, genreIds, overview, releaseDate, voteAverage];



}
