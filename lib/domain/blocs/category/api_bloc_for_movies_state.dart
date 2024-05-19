part of 'api_bloc_for_movies_bloc.dart';

@immutable
sealed class ApiState {}

//now playing

final class NowPlayingInitial extends ApiState {}

class NowPlayingLoadingState extends ApiState {}

class NowPlayingLoadedState extends ApiState {
  final NowPlaying loadedNowPlaying;
  NowPlayingLoadedState({required this.loadedNowPlaying});
}

class NowPlayingErrorState extends ApiState {}

// popular

final class PopularInitial extends ApiState {}

class PopularLoadingState extends ApiState {}

class PopularLoadedState extends ApiState {
  final PopularList loadedPopular;
  PopularLoadedState({required this.loadedPopular});
}

class PopularErrorState extends ApiState {}

//top rated

final class TopRatedInitial extends ApiState {}

class TopRatedLoadingState extends ApiState {}

class TopRatedLoadedState extends ApiState {
    final MyTopRatedList loadedTopRated;
  TopRatedLoadedState({required this.loadedTopRated});
}

class TopRatedErrorState extends ApiState {}

// upcoming

final class UpcomingInitial extends ApiState {}

class UpcomingLoadingState extends ApiState {}

class UpcomingLoadedState extends ApiState {
  final MyUpcomingList loadedUpcoming;
  UpcomingLoadedState({required this.loadedUpcoming});
}

class UpcomingErrorState extends ApiState {}


