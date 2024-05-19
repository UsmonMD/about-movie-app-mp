part of 'api_bloc_for_movies_bloc.dart';

@immutable
sealed class ApiMovieEvent {}

//now playing

class NowPlayingLoadingEvent extends ApiMovieEvent {}

//popular

class PopularLoadingEvent extends ApiMovieEvent {}

//top rated

class TopRatedLoadingEvent extends ApiMovieEvent {}

//upcoming

class UpcomingLoadingEvent extends ApiMovieEvent {}

//detail

class DetailLoadingEvent extends ApiMovieEvent {}
