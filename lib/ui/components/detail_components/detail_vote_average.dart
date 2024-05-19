import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class DetailRateBtn extends StatelessWidget {
  const DetailRateBtn({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocBuilder<MoviesBloc, MoviesState>(
      builder: (context, state) {
        if (state is MoviesInitial) {
          return const Center(child: Text('initial'));
        }
        if (state is ErrorState) {
          return const Center(child: Text('errorstate'));
        }
        if (state is LoadingState) {
          return const Center(child: CircularProgressIndicator());
        }

        if (state is DetailPageLoadedState) {
          return Container(
            width: 54,
            height: 24,
            decoration: BoxDecoration(
                color: const Color.fromRGBO(37, 40, 54, 0.7),
                borderRadius: BorderRadius.circular(8)),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.star_border_outlined,
                  color: AppColors.redCategoryColor,
                ),
                const SizedBox(width: 4),
                Text(
                  double.parse(
                          state.voteAverage.voteAverage!.toStringAsFixed(1))
                      .toString(),
                  style: AppStyle.fontStyle.copyWith(
                    color: AppColors.whiteColor,
                    fontSize: 12,
                    letterSpacing: 0.12,
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
