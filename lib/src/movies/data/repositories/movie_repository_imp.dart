import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/src/core/error/exception.dart';
import 'package:movies/src/core/error/failure.dart';
import 'package:movies/src/movies/data/data_sources/movie_service.dart';
import 'package:movies/src/movies/domain/entities/movie.dart';
import 'package:movies/src/movies/domain/entities/movie_details.dart';
import 'package:movies/src/movies/domain/repositories/movie_repository.dart';


@LazySingleton(as: MovieRepository)
class MovieRepositoryImp implements MovieRepository {
  final MovieService _movieService;

  MovieRepositoryImp(this._movieService);

  @override
  Future<Either<Failure, List<Movie>>> getNowPlaying() async {
    try {
      return Right(await _movieService.getNowPlaying());
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message ?? ""));
    }
  }

  @override
  Future<Either<Failure, List<Movie>>> getPopular() async {
    try {
      return Right(await _movieService.getPopular());
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message ?? ""));
    }  }

  @override
  Future<Either<Failure, List<Movie>>> getTopRated() async {
    try {
      return Right(await _movieService.getTopRated());
    } on ServerException catch (failure) {
      return Left(ServerFailure(failure.errorMessageModel.message ?? ""));
    }
  }

  @override
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id) async {
    try {
      return Right(await _movieService.getMovieDetails(id));
    } on ServerException catch (failure) {
    return Left(ServerFailure(failure.errorMessageModel.message ?? ""));
    }
  }
}
