part of 'movies_bloc.dart';

@immutable
sealed class MoviesEvent {}

class TabChangeEvent extends MoviesEvent {
  final int tabIndex;

  TabChangeEvent({this.tabIndex = 0});
}

class CategoryLoadEvent extends MoviesEvent {}

class DetailPageLoadEvent extends MoviesEvent {}
