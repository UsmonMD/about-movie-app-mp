part of 'movies_bloc.dart';

@immutable
sealed class MoviesState {
  final int tabIndex;

  const MoviesState({this.tabIndex = 0});
}

final class MoviesInitial extends MoviesState {
  const MoviesInitial({super.tabIndex = 0});
}

class LoadingState extends MoviesState {}

class CategoryLoadedState extends MoviesState {
  final NowPlaying nowPlaying;
  final MyUpcomingList upcoming;
  final MyTopRatedList topRated;
  final PopularList popular;

  const CategoryLoadedState({
    required this.nowPlaying,
    required this.upcoming,
    required this.topRated,
    required this.popular,
  });
}

class DetailPageLoadedState extends MoviesState {
  final MovieDetailList genres;
  final MovieDetailList backdropPath;
  final MovieDetailList originalTitle;
  final MovieDetailList posterPath;
  final MovieDetailList releaseDate;
  final MovieDetailList runtime;
  final MovieDetailList overview;
  final MovieDetailList voteAverage;
  final MovieCreditsList castPic;
  final MovieCreditsList castName;

  const DetailPageLoadedState({
    required this.genres,
    required this.backdropPath,
    required this.originalTitle,
    required this.posterPath,
    required this.releaseDate,
    required this.runtime,
    required this.overview,
    required this.voteAverage,
    required this.castPic,
    required this.castName,
  });
}

class ErrorState extends MoviesState {}
