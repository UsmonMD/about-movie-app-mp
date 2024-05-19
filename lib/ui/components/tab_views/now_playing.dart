import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/components/body/movies_covers.dart';

class NowPlayingBtnTab extends StatelessWidget {
  const NowPlayingBtnTab({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesInitial) {
          return const Center(child: Text('NO DATA'));
        }
        if (state is LoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is ErrorState) {
          return const Center(child: Text('ERROR'));
        }
        if (state is CategoryLoadedState) {
          return Padding(
            padding: EdgeInsets.only(bottom: 35.h),
            child: GridView.builder(
              gridDelegate: SliverGridDelegateWithMaxCrossAxisExtent(
                  mainAxisExtent: 180.w, maxCrossAxisExtent: 150.h),
              itemBuilder: (context, index) => Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.5.w, vertical: 9.h),
                child: MoviesCover(
                  image:
                      '${Api.imagePath}${state.nowPlaying.results?[index].posterPath}',
                  movieId: '${state.nowPlaying.results?[index].id}',
                ),
              ),
              itemCount: state.nowPlaying.results?.length,
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
