import 'package:equatable/equatable.dart';
import 'package:movies/src/core/utils/enums.dart';
import 'package:movies/src/movies/domain/entities/movie.dart';

abstract class HomeState extends Equatable {
  final List<Movie> nowPlaying;
  final List<Movie> topRate;
  final List<Movie> popular;
  final RequestState nowPlayingRequestState;
  final RequestState topRateRequestState;
  final RequestState popularRequestState;
  final String nowPlayingMessage;
  final String topRateMessage;
  final String popularMessage;

  @override
  List<Object?> get props => [
        nowPlayingRequestState,
        nowPlaying,
        nowPlayingMessage,
        popularRequestState,
        popular,
        popularMessage,
        topRateRequestState,
        topRate,
        topRateMessage,
      ];

  const HomeState(
      {this.nowPlaying = const [],
      this.topRate = const [],
      this.popular = const [],
      this.nowPlayingRequestState = RequestState.loading,
      this.topRateRequestState = RequestState.loading,
      this.popularRequestState = RequestState.loading,
      this.nowPlayingMessage = "",
      this.topRateMessage = "",
      this.popularMessage = ""});
}

class HomeInitial extends HomeState {
  const HomeInitial();

  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class PopularRequestState extends HomeState {
  const PopularRequestState(
      {List<Movie> popular = const [],
      RequestState popularRequestState = RequestState.loading,
      String popularMessage = ""})
      : super(
            popular: popular,
            popularRequestState: popularRequestState,
            popularMessage: popularMessage);
}

class NowPlayingRequestState extends HomeState {
  const NowPlayingRequestState(
      {List<Movie> nowPlaying = const [],
      RequestState nowPlayingRequestState = RequestState.loading,
      String nowPlayingMessage = ""})
      : super(
            nowPlaying: nowPlaying,
            nowPlayingRequestState: nowPlayingRequestState,
            nowPlayingMessage: nowPlayingMessage);
}

class TopRateRequestState extends HomeState {
  const TopRateRequestState(
      {List<Movie> topRate = const [],
      RequestState topRateRequestState = RequestState.loading,
      String topRateMessage = ""})
      : super(
            topRate: topRate,
            topRateRequestState: topRateRequestState,
            topRateMessage: topRateMessage);
}
