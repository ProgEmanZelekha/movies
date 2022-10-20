import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/src/core/error/exception.dart';
import 'package:movies/src/core/network/error_message_model.dart';
import 'package:movies/src/core/utils/constants.dart';
import 'package:movies/src/movies/data/models/movie_details_model.dart';
import 'package:movies/src/movies/data/models/movie_model.dart';

import 'movie_service.dart';

@LazySingleton(as:MovieService)
class MovieServiceImp extends MovieService {
  final Dio dio;

  MovieServiceImp(this.dio);

  @override
  Future<List<MovieModel>> getNowPlaying() async {
    final response = await dio
        .get("${Constants.baseUrl}/movie/now_playing?api_key=${Constants.apiKey}");
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] )
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getPopular() async {
    final response = await dio
        .get("${Constants.baseUrl}/movie/popular?api_key=${Constants.apiKey}");
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<List<MovieModel>> getTopRated() async {
    final response = await dio
        .get("${Constants.baseUrl}/movie/top_rated?api_key=${Constants.apiKey}");
    if (response.statusCode == 200) {
      return List<MovieModel>.from((response.data["results"] as List)
          .map((e) => MovieModel.fromJson(e)));
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }

  @override
  Future<MovieDetailsModel> getMovieDetails(int id) async {
    final response = await dio
        .get("${Constants.baseUrl}/movie/$id?api_key=${Constants.apiKey}");
    if (response.statusCode == 200) {
      return response.data;
    } else {
      throw ServerException(
          errorMessageModel: ErrorMessageModel.fromJson(response.data));
    }
  }
}
