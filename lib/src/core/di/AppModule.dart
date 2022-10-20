

import 'package:dio/dio.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/src/movies/data/data_sources/movie_service_imp.dart';

@module
abstract class AppModule{
  @preResolve
  Future<Dio> get dio async => await Dio();

  MovieServiceImp getAuthService(Dio dio) {
    return MovieServiceImp(dio);
  }

}