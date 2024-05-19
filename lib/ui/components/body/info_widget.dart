import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class MovieInfoWidget extends StatelessWidget {
  const MovieInfoWidget({super.key});

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
            padding: const EdgeInsets.only(top: 16),
            child: SizedBox(
              width: 274,
              height: 32,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Icon(Icons.calendar_month_outlined),
                  const SizedBox(width: 4),
                  Text(
                    state.releaseDate.releaseDate?.substring(0, 4) ?? 'error',
                    style: AppStyle.fontStyle,
                  ),
                  const SizedBox(width: 28),
                  Text(
                    '${state.runtime.runtime} минут',
                    style: AppStyle.fontStyle,
                  ),
                  const SizedBox(width: 28),
                  Text(
                    state.genres.genres?.first.name ?? 'error',
                    style: AppStyle.fontStyle,
                  ),
                ],
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
