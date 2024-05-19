import 'package:bloc/bloc.dart';
import 'package:meta/meta.dart';
import 'package:movies_app/domain/api/c_api_list.dart/categories_repository.dart';
import 'package:movies_app/domain/api/c_api_list.dart/now_laying_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/popular_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/top_rated_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/upcoming_list.dart';
import 'package:movies_app/domain/models/movie_credits.dart';
import 'package:movies_app/domain/models/movie_detail.dart';

part 'movies_event.dart';
part 'movies_state.dart';

class MoviesBloc extends Bloc<MoviesEvent, MoviesState> {
  final CategoriesRepository categoriesRepository;

  MoviesBloc({required this.categoriesRepository}) : super(const MoviesInitial()) {
    on<MoviesEvent>(
      (event, emit) {
        if (event is TabChangeEvent) {
          emit(MoviesInitial(tabIndex: event.tabIndex));
        }
      },
    );
    on<CategoryLoadEvent>(
      (event, emit) async {
        emit(LoadingState());

        try {
          final NowPlaying nowPlaying =
              await categoriesRepository.getNowPlaying();
          final MyUpcomingList upcoming = await categoriesRepository.getUpcoming();
          final MyTopRatedList topRated = await categoriesRepository.getTopRated();
          final PopularList popular = await categoriesRepository.getPopular();

          emit(CategoryLoadedState(
            nowPlaying: nowPlaying,
            upcoming: upcoming,
            topRated: topRated,
            popular: popular,
          ));
        } catch (e) {
          emit(ErrorState());
        }
      },
    );

    on<DetailPageLoadEvent>(
      (event, emit) async {
        emit(LoadingState());

        try {
          final MovieDetailList movieDetail =
              await categoriesRepository.getAllMovieDetail();
          final MovieCreditsList movieCredits =
              await categoriesRepository.getAllMovieCredits();

          emit(DetailPageLoadedState(
            genres: movieDetail,
            backdropPath: movieDetail,
            originalTitle: movieDetail,
            posterPath: movieDetail,
            releaseDate: movieDetail,
            runtime: movieDetail,
            overview: movieDetail,
            voteAverage: movieDetail,
            castPic: movieCredits,
            castName: movieCredits,
          ));
        } catch (e) {
          emit(ErrorState());
        }
      },
    );
  }
}
