import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/api/c_api_list.dart/categories_repository.dart';
import 'package:movies_app/domain/api/c_api_list.dart/popular_list.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/domain/blocs/category/api_bloc_for_movies_bloc.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/widgets/categories_button_widget.dart';
import 'package:movies_app/ui/widgets/sizedbox_widget.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => ApiBloc(
        repository: CategoriesRepository(),
      )..add(
          PopularLoadingEvent(),
        ),
      child: Scaffold(
        appBar: AppBar(
          toolbarHeight: 20,
          centerTitle: true,
          backgroundColor: AppColors.bgColor,
        ),
        body: const MainPageBody(),
      ),
    );
  }
}

class MainPageBody extends StatelessWidget {
  const MainPageBody({super.key});
  final String link =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdUMBlUAh4WZbdtMtoVm26JyxjihhMj1QdXYP5Lk4LVw&s';

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<ApiBloc, ApiState>(
      builder: (context, state) {
        if (state is PopularLoadingState) {
          return Center(
            child: CupertinoActivityIndicator(
              color: AppColors.buttonColor,
              radius: 30,
            ),
          );
        }
        if (state is PopularLoadedState) {
          return Container(
            color: AppColors.bgColor,
            child: SingleChildScrollView(
              physics: const AlwaysScrollableScrollPhysics(),
              child: Center(
                child: Column(
                  children: [
                    const CategoriesButtonWidget(),
                    const SizedBoxHeightWidget(height: 20),
                    const Text(
                      'Популярные',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBoxHeightWidget(height: 20),
                    SizedBox(
                      height: 13350,
                      child: ListView.separated(
                        itemBuilder: (context, index) {
                          final ResultsPopular result =
                              state.loadedPopular.results![index];
                          return SizedBox(
                            width: 395,
                            height: 647.1875,
                            child: MaterialButton(
                              onPressed: () {
                                context.push(RouteNames.detailPage);
                                Api.movieId = state
                                    .loadedPopular.results?[index].id
                                    .toString();
                              },
                              child: Column(
                                children: [
                                  Container(
                                    width: 395,
                                    height: 526.7,
                                    decoration: BoxDecoration(
                                      borderRadius: const BorderRadius.only(
                                        topLeft: Radius.circular(15),
                                        topRight: Radius.circular(15),
                                      ),
                                      image: DecorationImage(
                                        fit: BoxFit.cover,
                                        image: NetworkImage(
                                          'https://image.tmdb.org/t/p/w500${result.posterPath}',
                                        ),
                                      ),
                                    ),
                                  ),
                                  Container(
                                    height: 120,
                                    width: 395,
                                    decoration: BoxDecoration(
                                      color:
                                          AppColors.buttonColor.withOpacity(0.3),
                                      borderRadius: const BorderRadius.only(
                                        bottomLeft: Radius.circular(15),
                                        bottomRight: Radius.circular(15),
                                      ),
                                    ),
                                    child: Material(
                                      color:
                                          AppColors.darkBlueColor.withOpacity(0),
                                      child: Center(
                                        child: ListTile(
                                          isThreeLine: true,
                                          title: Text(
                                            '${result.title}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w900,
                                              fontSize: 18,
                                            ),
                                          ),
                                          subtitle: Text(
                                            '${result.voteAverage}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18,
                                            ),
                                          ),
                                          trailing: Text(
                                            '${result.releaseDate}',
                                            style: const TextStyle(
                                              fontWeight: FontWeight.w100,
                                              fontSize: 18,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) =>
                            const SizedBoxHeightWidget(height: 20),
                        itemCount: state.loadedPopular.results!.length,
                        physics: const NeverScrollableScrollPhysics(),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
        if (state is PopularErrorState) {
          return Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Icon(
                  Icons.network_check_outlined,
                  size: 225,
                  color: AppColors.buttonColor,
                ),
                const SizedBoxHeightWidget(height: 20),
                Text(
                  ' Ошибка подкючения,\nпожалуйста проверьте\nсостояние соеденения',
                  style: TextStyle(
                    fontSize: 30,
                    color: AppColors.buttonColor,
                  ),
                ),
              ],
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
