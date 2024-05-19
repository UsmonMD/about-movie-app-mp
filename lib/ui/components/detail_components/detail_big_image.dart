import 'package:flutter/cupertino.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/theme/app_colors.dart';

class DetailMovieCover extends StatelessWidget {
  const DetailMovieCover({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesInitial) {
          return const Center(child: Text('initial'));
        }
        if (state is ErrorState) {
          return const Center(child: Text('ERROR'));
        }
        if (state is LoadingState) {
          return Center(
            child: CupertinoActivityIndicator(
              radius: 35,
              color: AppColors.greenColor,
            ),
          );
        }

        if (state is DetailPageLoadedState) {
          return Container(
            width: MediaQuery.of(context).size.width,
            height: 600,
            decoration: BoxDecoration(
              image: DecorationImage(
                image: NetworkImage(
                  '${Api.imagePath}${state.backdropPath.backdropPath ?? 'https://t4.ftcdn.net/jpg/04/73/25/49/360_F_473254957_bxG9yf4ly7OBO5I0O5KABlN930GwaMQz.jpg'}',
                ),
                fit: BoxFit.cover,
              ),
              borderRadius: const BorderRadius.only(
                bottomLeft: Radius.circular(16),
                bottomRight: Radius.circular(16),
              ),
            ),
          );
        }
        return const SizedBox();
      },
    );
  }
}
