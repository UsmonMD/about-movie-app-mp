import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class DetailPageAboutMovie extends StatelessWidget {
  const DetailPageAboutMovie({super.key});

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
          return const Center(child: Text('error'));
        }
        if (state is DetailPageLoadedState) {
          return Padding(
            padding: const EdgeInsets.symmetric(
              horizontal: 29,
              vertical: 15,
            ),
            child: Text(
              state.overview.overview ?? 'no overview',
              style: AppStyle.fontStyle.copyWith(
                fontSize: 15,
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
