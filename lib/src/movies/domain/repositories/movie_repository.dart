import 'package:dartz/dartz.dart';
import 'package:movies/src/core/error/failure.dart';
import 'package:movies/src/movies/domain/entities/movie.dart';
import 'package:movies/src/movies/domain/entities/movie_details.dart';


abstract class MovieRepository {
  Future<Either<Failure, MovieDetails>> getMovieDetails(int id);
  Future<Either<Failure, List<Movie>>> getNowPlaying();
  Future<Either<Failure, List<Movie>>> getPopular();
  Future<Either<Failure, List<Movie>>> getTopRated();
}
