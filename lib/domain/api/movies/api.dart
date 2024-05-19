import 'package:dio/dio.dart';
import 'package:movies_app/domain/api/c_api_list.dart/now_laying_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/popular_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/top_rated_list.dart';
import 'package:movies_app/domain/api/c_api_list.dart/upcoming_list.dart';
import 'package:movies_app/domain/models/movie_credits.dart';
import 'package:movies_app/domain/models/movie_detail.dart';

abstract class Api {
  static final linkSingUp = Uri.parse('https://www.themoviedb.org/signup');
  static const apiKey = '?api_key=22e6d931b1ec0bd098c4998a2f4f549f';

  static final Dio dio = Dio();

  static String? movieId;

  static String imagePath =
      'https://www.themoviedb.org/t/p/w220_and_h330_face/';

  // ignore: unused_element
  static set _movieId(String? id) {
    movieId = id;
  }

  // ignore: unnecessary_getters_setters
  static String? get _movieId => movieId;

  static Future<MovieDetailList> getMovieDetail() async {
    final movieDetailResponse =
        await dio.get('https://api.themoviedb.org/3/movie/$_movieId$apiKey');
    try {
      final movieDetail = MovieDetailList.fromJson(movieDetailResponse.data);
      return movieDetail;
    } catch (e) {
      final movieDetail = MovieDetailList.fromJson(movieDetailResponse.data);
      return movieDetail;
    }
  }

  static Future<MovieCreditsList> getMovieCredits() async {
    final movieCreditsResponse = await dio
        .get('https://api.themoviedb.org/3/movie/$_movieId/credits$apiKey');
    try {
      final movieCredits = MovieCreditsList.fromJson(movieCreditsResponse.data);
      return movieCredits;
    } catch (e) {
      final movieCredits = MovieCreditsList.fromJson(movieCreditsResponse.data);
      return movieCredits;
    }
  }

  static Future<NowPlaying> getNowPlaying() async {
    final nowPlayingResponse =
        await dio.get('https://api.themoviedb.org/3/movie/now_playing$apiKey');
    try {
      final nowPlaying = NowPlaying.fromJson(nowPlayingResponse.data);
      return nowPlaying;
    } catch (e) {
      final nowPlaying = NowPlaying.fromJson(nowPlayingResponse.data);
      return nowPlaying;
    }
  }

  static Future<MyUpcomingList> getUpcoming() async {
    final upcomingResponse =
        await dio.get('https://api.themoviedb.org/3/movie/upcoming$apiKey');
    try {
      final upcoming = MyUpcomingList.fromJson(upcomingResponse.data);
      return upcoming;
    } catch (e) {
      final upcoming = MyUpcomingList.fromJson(upcomingResponse.data);
      return upcoming;
    }
  }

  static Future<MyTopRatedList> getTopRated() async {
    final topRatedResponse =
        await dio.get('https://api.themoviedb.org/3/movie/top_rated$apiKey');
    try {
      final topRated = MyTopRatedList.fromJson(topRatedResponse.data);
      return topRated;
    } catch (e) {
      final topRated = MyTopRatedList.fromJson(topRatedResponse.data);
      return topRated;
    }
  }

  static Future<PopularList> getPopular() async {
    final popularResponse =
        await dio.get('https://api.themoviedb.org/3/movie/popular$apiKey');
    try {
      final popular = PopularList.fromJson(popularResponse.data);
      return popular;
    } catch (e) {
      final popular = PopularList.fromJson(popularResponse.data);
      return popular;
    }
  }
}
