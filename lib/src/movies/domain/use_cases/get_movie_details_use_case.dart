import 'dart:ffi';

import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/src/core/error/failure.dart';
import 'package:movies/src/core/usecase/usecase.dart';
import 'package:movies/src/movies/data/repositories/movie_repository_imp.dart';
import 'package:movies/src/movies/domain/entities/movie.dart';
import 'package:movies/src/movies/domain/entities/movie_details.dart';
import 'package:movies/src/movies/domain/repositories/movie_repository.dart';

@LazySingleton()
class GetNowPlayingUseCase extends UseCase<Either<Failure, MovieDetails>,int> {
  final MovieRepository _movieRepository;

  GetNowPlayingUseCase(this._movieRepository);

  @override
  Future<Either<Failure, MovieDetails>> call({ int? params}) async{
    return await _movieRepository.getMovieDetails(params??0);

  }

}
