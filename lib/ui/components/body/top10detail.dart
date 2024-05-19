import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/components/body/movies_covers.dart';

class Top10List extends StatelessWidget {
  const Top10List({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesInitial) {
          return const Center(child: Text('NO DATA'));
        }
        if (state is ErrorState) {
          return const Center(child: Text('ERROR'));
        }
        if (state is CategoryLoadedState) {
          return SizedBox(
            width: double.infinity,
            height: 250,
            child: ListView.builder(
              scrollDirection: Axis.horizontal,
              itemBuilder: (context, index) => Top10(
                movieId: '${state.topRated.results?[index].id}',
                index: index,
                image:
                    '${Api.imagePath}${state.topRated.results?[index].posterPath}',
              ),
              itemCount: 10, 
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
