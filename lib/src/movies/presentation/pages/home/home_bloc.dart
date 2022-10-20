import 'package:equatable/equatable.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:movies/src/core/utils/enums.dart';
import 'package:movies/src/injector.dart';
import 'package:movies/src/movies/data/data_sources/movie_service.dart';
import 'package:movies/src/movies/domain/use_cases/get_now_playing_use_case.dart';
import 'package:movies/src/movies/domain/use_cases/get_popular_use_case.dart';
import 'package:movies/src/movies/domain/use_cases/get_top_rate_use_case.dart';
import 'package:movies/src/movies/presentation/pages/home/home_state.dart';

part 'home_event.dart';

@Injectable()
class HomeBloc extends Bloc<HomeEvent, HomeState> {
  final GetNowPlayingUseCase _getNowPlayingUseCase;
  final GetTopRateUseCase _getTopRateUseCase;
  final GetPopularUseCase _getPopularUseCase;

  HomeBloc(this._getNowPlayingUseCase, this._getTopRateUseCase,
      this._getPopularUseCase)
      : super(const HomeInitial()) {
    on<GetNowPlayingEvent>(getNowPlaying);
    on<GetPopularEvent>(getPopular);
    on<GetTopRatedEvent>(getTopRated);
    on<HomeEvent>((event, emit) {});
  }

  void getNowPlaying(event, emit) async {
    emit(const NowPlayingRequestState(
        nowPlayingRequestState: RequestState.loading));
    var response = await _getNowPlayingUseCase();
    response.fold(
        (l) => emit(NowPlayingRequestState(
            nowPlayingMessage: l.message,
            nowPlayingRequestState: RequestState.error)), (r) {
      emit(NowPlayingRequestState(
          nowPlaying: r, nowPlayingRequestState: RequestState.loaded));
    });
  }

  void getPopular(event, emit) async {
    emit(const PopularRequestState(popularRequestState: RequestState.loading));
    var response = await _getPopularUseCase();
    response.fold(
        (l) => emit(PopularRequestState(
            popularMessage: l.message,
            popularRequestState: RequestState.error)), (r) {
      emit(PopularRequestState(
          popular: r, popularRequestState: RequestState.loaded));
    });
  }

  void getTopRated(event, emit) async {
    emit(const TopRateRequestState(topRateRequestState: RequestState.loading));
    var response = await _getTopRateUseCase();
    response.fold(
        (l) => emit(TopRateRequestState(
            topRateMessage: l.message,
            topRateRequestState: RequestState.error)), (r) {
      emit(TopRateRequestState(
          topRate: r, topRateRequestState: RequestState.loaded));
    });
  }
}
