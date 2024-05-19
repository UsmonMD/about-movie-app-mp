import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/components/body/movies_covers.dart';

class TopRatedBtnTab extends StatelessWidget {
  const TopRatedBtnTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is CategoryLoadedState) {
          return Padding(
            padding: EdgeInsets.only(bottom: 35.h),
            child: GridView.builder(
              gridDelegate: const SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 180, maxCrossAxisExtent: 150),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.5.w, vertical: 9.h),
                child: MoviesCover(
                  image:
                      '${Api.imagePath}${state.topRated.results?[index].posterPath}',
                  movieId: '${state.topRated.results?[index].id}',
                ),
              ),
              itemCount: state.topRated.results?.length,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
