import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/api/c_api_list.dart/categories_repository.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/components/detail_components/detail_page_body.dart';
import 'package:movies_app/ui/components/detail_components/detail_vote_average.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) =>
          MoviesBloc(categoriesRepository: CategoriesRepository())
            ..add(DetailPageLoadEvent()),
      child: Scaffold(
        appBar: AppBar(
          leading: IconButton(
            onPressed: () {
              context.pop();
            },
            icon: const Icon(
              Icons.arrow_back_ios_new,
            ),
          ),
          title: Text(
            'Детальная информация',
            style: AppStyle.fontStyle.copyWith(fontSize: 22.5),
          ),
          backgroundColor: AppColors.bgColor,
        ),
        backgroundColor: AppColors.bgColor,
        body: BlocBuilder<MoviesBloc, MoviesState>(
          builder: (context, state) {
            if (state is MoviesInitial) {
              return const Center(
                child: Text('initial'),
              );
            }
            if (state is LoadingState) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            if (state is ErrorState) {
              return const Center(
                child: Text(
                  'Проверьте состояние интернет-соеденения\n     Ошибка при загрузке данных фильма',
                ),
              );
            }
            if (state is DetailPageLoadedState) {
              return const Stack(
                children: [
                  DetailBody(),
                  Positioned(
                    right: 20,
                    top: 115,
                    child: DetailRateBtn(),
                  ),
                ],
              );
            }
            return const SizedBox();
          },
        ),
      ),
    );
  }
}
