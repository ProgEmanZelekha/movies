

import 'package:movies/src/movies/domain/entities/movie_details.dart';

/// backdroppath : "/5GA3vV1aWWHTSDO5eno8V5zDo8r.jpg"
/// GenresModel : [{"id":27,"name":"Horror"},{"id":53,"name":"Thriller"}]
/// id : 760161
/// overview : "After escaping from an Estonian psychiatric facility, Leena Klammer travels to America by impersonating Esther, the missing daughter of a wealthy family. But when her mask starts to slip, she is put against a mother who will protect her family from the murderous “child” at any cost."
/// releasedate : "2022-07-27"
/// runtime : 99
/// title : "Orphan: First Kill"
/// voteaverage : 6.958

class MovieDetailsModel extends MovieDetails{

//
//   MovieDetailsModel({
//       String? backdropPath,
//       List<GenresModel>? genresModel,
//       num? id,
//       String? overview,
//       String? releaseDate,
//       num? runtime,
//       String? title,
//       num? voteAverage,}){
//     backdropPath = backdropPath;
//     genresModel = genresModel;
//     id = id;
//     overview = overview;
//     releaseDate = releaseDate;
//     runtime = runtime;
//     title = title;
//     voteAverage = voteAverage;
// }

  MovieDetailsModel.fromJson(dynamic json) {
    backdropPath = json['back_drop_path'];
    if (json['genres'] != null) {
      genres = [];
      json['genres'].forEach((v) {
        genres?.add(GenresModel.fromJson(v));
      });
    }
    id = json['id'];
    overview = json['overview'];
    releaseDate = json['release_date'];
    runtime = json['runtime'];
    title = json['title'];
    voteAverage = json['vote_average'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['back_drop_path'] = backdropPath;
    if (genres != null) {
      map['genres'] = genres?.map((v) => (v as GenresModel).toJson()).toList();
    }
    map['id'] = id;
    map['overview'] = overview;
    map['release_date'] = releaseDate;
    map['runtime'] = runtime;
    map['title'] = title;
    map['vote_average'] = voteAverage;
    return map;
  }

}

/// id : 27
/// name : "Horror"

class GenresModel extends Genres{
  GenresModel.fromJson(dynamic json) {
    id = json['id'];
    name = json['name'];
  }

  Map<String, dynamic> toJson() {
    final map = <String, dynamic>{};
    map['id'] = id;
    map['name'] = name;
    return map;
  }

}