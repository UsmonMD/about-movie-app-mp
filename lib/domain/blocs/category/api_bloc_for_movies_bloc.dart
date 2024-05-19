import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/domain/api/c_api_list.dart/categories_repository.dart';
import 'package:movies_app/domain/api/c_api_list.dart/now_laying_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/popular_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/top_rated_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/upcoming_list.dart';

part 'api_bloc_for_movies_event.dart';
part 'api_bloc_for_movies_state.dart';

class ApiBloc extends Bloc<ApiMovieEvent, ApiState> {
  final CategoriesRepository repository;
  ApiBloc({required this.repository}) : super(NowPlayingInitial()) {
    //now playing

    on<NowPlayingLoadingEvent>(
      (event, emit) async {
        emit(NowPlayingLoadingState());
        try {
          final NowPlaying loadedNowPlaying =
              await repository.getNowPlaying();
          emit(NowPlayingLoadedState(loadedNowPlaying: loadedNowPlaying));
        } catch (e) {
          emit(NowPlayingErrorState());
        }
      },
    );

    //popular

    on<PopularLoadingEvent>(
      (event, emit) async {
        emit(PopularLoadingState());
        try {
          final PopularList loadedPopular = await repository.getPopular();
          emit(PopularLoadedState(
            loadedPopular: loadedPopular,
          ));
        } catch (e) {
          emit(PopularErrorState());
        }
      },
    );

    //top rated

    on<TopRatedLoadingEvent>(
      (event, emit) async {
        emit(TopRatedLoadingState());
        try {
          final MyTopRatedList loadedTopRated = await repository.getTopRated();
          emit(TopRatedLoadedState(
            loadedTopRated: loadedTopRated,
          ));
        } catch (e) {
          emit(TopRatedErrorState());
        }
      },
    );

    //upcoming

    on<UpcomingLoadingEvent>(
      (event, emit) async {
        emit(UpcomingLoadingState());
        try {
          final MyUpcomingList loadedUpcoming = await repository.getUpcoming();
          emit(UpcomingLoadedState(
            loadedUpcoming: loadedUpcoming,
          ));
        } catch (e) {
          emit(UpcomingErrorState());
        }
      },
    );
  }
}
