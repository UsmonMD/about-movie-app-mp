import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/api/c_api_list.dart/categories_repository.dart';
import 'package:movies_app/domain/api/c_api_list.dart/now_laying_list.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/domain/blocs/category/api_bloc_for_movies_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/theme/app_colors.dart';

class NowPlaying extends StatelessWidget {
  const NowPlaying({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(
        repository: CategoriesRepository(),
      )..add(NowPlayingLoadingEvent()),
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Now Playing'),
          backgroundColor: AppColors.bgColor,
        ),
        body: const NowPlayingBody(),
      ),
    );
  }
}

class NowPlayingBody extends StatelessWidget {
  const NowPlayingBody({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        if (state is NowPlayingInitial) {
          return const Center(
            child: Text(
              'Initial',
              style: TextStyle(
                color: Colors.black,
                fontSize: 50,
              ),
            ),
          );
        }
        if (state is NowPlayingLoadingState) {
          return Center(
            child: CupertinoActivityIndicator(
              color: AppColors.buttonColor,
              radius: 30,
              animating: true,
            ),
          );
        }
        if (state is NowPlayingLoadedState) {
          return Container(color: AppColors.bgColor,
            child: ListView.separated(
              itemBuilder: (context, index) {
                final ResultsCategories result =
                    state.loadedNowPlaying.results![index];
                return Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 20.0,
                    vertical: 5.0,
                  ),
                  child: Card(
                    color: AppColors.buttonColor,
                    child: Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Container(
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                        child: ListTile(
                          onTap: () {
                            context.push(RouteNames.detailPage);
                            Api.movieId = state
                                .loadedNowPlaying.results?[index].id
                                .toString();
                          },
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(right: 15.0),
                                child: SizedBox(
                                  height: 140,
                                  width: 105,
                                  child: Image.network(
                                    'https://image.tmdb.org/t/p/w500${result.posterPath}',
                                    width: MediaQuery.of(context).size.width,
                                    height: MediaQuery.of(context).size.height,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              ),
                              SizedBox(
                                width: 183,
                                child: Column(
                                  children: [
                                    Text(
                                      result.title ?? 'No title',
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),
                                    const SizedBox(
                                      height: 5,
                                    ),
                                    Text(
                                      result.overview ?? 'No overview',
                                      style: TextStyle(
                                        color: AppColors.whiteColor,
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              },
              separatorBuilder: (context, index) => const SizedBox(),
              itemCount: state.loadedNowPlaying.results!.length,
            ),
          );
        }
        if (state is NowPlayingErrorState) {
          return const Center(child: Text('Проверьте состояние интернет-соеденения'));
        }
        return Container(
          color: Colors.amber,
        );
      },
    );
  }
}
