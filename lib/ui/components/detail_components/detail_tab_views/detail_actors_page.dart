import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/domain/blocs/movies_bloc/movies_bloc.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class DetailPageCast extends StatelessWidget {
  const DetailPageCast({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 29, right: 41, top: 28),
      child: BlocBuilder<MoviesBloc, MoviesState>(
        builder: (context, state) {
          if (state is MoviesInitial) {
            return const Center(child: Text('NO DATA'));
          }
          if (state is LoadingState) {
            return const Center(child: CircularProgressIndicator());
          }
          if (state is ErrorState) {
            return const Center(child: Text('ERROR'));
          }
          if (state is DetailPageLoadedState) {
            return GridView.builder(
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount: 2,
                mainAxisSpacing: 24,
                crossAxisSpacing: 65,
              ),
              itemBuilder: (context, index) => Cast(
                castPic:
                    '${Api.imagePath}${state.castPic.cast?[index].profilePath ?? '52kqB0Bei1TaTBx2rABrijVhhTG.jpg'}',
                castName: state.castPic.cast?[index].name ?? 'No Name',
              ),
              itemCount: state.castPic.cast?.length,
            );
          }
          return const SizedBox();
        },
      ),
    );
  }
}

class Cast extends StatelessWidget {
  const Cast({super.key, required this.castPic, required this.castName});

  final String castPic;
  final String castName;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceAround,
      children: [
        Container(
          width: 100,
          height: 100,
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(100),
            image: DecorationImage(
              image: NetworkImage(
                castPic,
              ),
              fit: BoxFit.cover,
              filterQuality: FilterQuality.high,
            ),
          ),
        ),
        SizedBox(
          width: 120,
          height: 15,
          child: Center(
            child: Text(
              castName,
              style: AppStyle.fontStyle.copyWith(
                fontSize: 12,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
