import 'package:movies/src/movies/data/models/movie_details_model.dart';
import 'package:movies/src/movies/data/models/movie_model.dart';

abstract class MovieService{
  Future<MovieDetailsModel> getMovieDetails(int id);
  Future<List<MovieModel>> getNowPlaying();
  Future<List<MovieModel>> getPopular();
  Future<List<MovieModel>> getTopRated();

}