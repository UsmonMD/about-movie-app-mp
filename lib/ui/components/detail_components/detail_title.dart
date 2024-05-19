import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class DetailMovieTitle extends StatelessWidget {
  const DetailMovieTitle({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesInitial) {
          return const Center(child: Text('initial'));
        }
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }
        if (state is ErrorState) {
          return const Center(child: Text('downloading error'));
        }
        if (state is DetailPageLoadedState) {
          return Padding(
            padding: const EdgeInsets.only(left: 136, right: 29),
            child: SizedBox(
              width: 210,
              height: 48,
              child: Text(
                state.originalTitle.title ?? 'no title',
                style: AppStyle.fontStyle.copyWith(
                  fontSize: 18,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
