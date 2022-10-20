import 'package:dartz/dartz.dart';
import 'package:equatable/equatable.dart';

/// backdroppath : "/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg"
/// genres : [{"id":27,"name":"Horror"},{"id":53,"name":"Thriller"}]
/// id : 760161
/// overview : "After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost."
/// releasedate : "2022-07-27"
/// runtime : 99
/// title : "Orphan: First Kill"
/// voteaverage : 6.958

class MovieDetails extends Equatable {
  MovieDetails({
    String? backdropPath,
    List<Genres>? genres,
    num? id,
    String? overview,
    String? releaseDate,
    num? runtime,
    String? title,
    num? voteAverage,
  }) {
    backdropPath = backdropPath;
    genres = genres;
    id = id;
    overview = overview;
    releaseDate = releaseDate;
    runtime = runtime;
    title = title;
    voteAverage = voteAverage;
  }

  String? backdropPath;
  List<Genres>? genres;
  num? id;
  String? overview;
  String? releaseDate;
  num? runtime;
  String? title;
  num? voteAverage;


  @override
  List<Object?> get props => [
        id,
        backdropPath,
        genres,
        overview,
        releaseDate,
        runtime,
        title,
        voteAverage
      ];
}

/// id : 27
/// name : "Horror"

class Genres extends Equatable{
  Genres({
    num? id,
    String? name,
  }) {
    id = id;
    name = name;
  }



  num? id;
  String? name;



 @override
  // TODO: implement props
  List<Object?> get props => [id,name];
}
