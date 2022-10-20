import 'package:dartz/dartz.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/src/core/error/failure.dart';
import 'package:movies/src/core/usecase/usecase.dart';
import 'package:movies/src/movies/domain/entities/movie.dart';
import 'package:movies/src/movies/domain/repositories/movie_repository.dart';

@LazySingleton()
class GetTopRateUseCase extends UseCase<Either<Failure, List<Movie>>,void> {
  final MovieRepository _movieRepository;

  GetTopRateUseCase(this._movieRepository);


  @override
  Future<Either<Failure, List<Movie>>> call({void params}) async{
    return await _movieRepository.getTopRated();

  }
}
