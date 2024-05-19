import 'package:movies_app/domain/api/c_api_list.dart/now_laying_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/popular_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/top_rated_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/upcoming_list.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/domain/models/movie_credits.dart';
import 'package:movies_app/domain/models/movie_detail.dart';

class CategoriesRepository {
  Future<NowPlaying> getNowPlaying() => Api.getNowPlaying();
  Future<PopularList> getPopular() => Api.getPopular();
  Future<MyTopRatedList> getTopRated() => Api.getTopRated();
  Future<MyUpcomingList> getUpcoming() => Api.getUpcoming();
  Future<MovieDetailList> getAllMovieDetail() => Api.getMovieDetail();
  Future<MovieCreditsList> getAllMovieCredits() => Api.getMovieCredits();
}
