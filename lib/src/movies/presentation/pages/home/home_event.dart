part of 'home_bloc.dart';

abstract class HomeEvent extends Equatable {
  const HomeEvent();
  @override
  // TODO: implement props
  List<Object?> get props => [];
}

class GetNowPlayingEvent extends HomeEvent{}
class GetPopularEvent extends HomeEvent{}
class GetTopRatedEvent extends HomeEvent{}
