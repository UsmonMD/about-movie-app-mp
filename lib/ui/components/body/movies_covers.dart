import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/domain/api/movies/api.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class MoviesCover extends StatelessWidget {
  const MoviesCover({super.key, this.movieId, this.image});

  final String? movieId;
  final String? image;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteNames.detailPage);
        Api.movieId = movieId;
      },
      child: Container(
        width: 95,
        height: 120,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          image: DecorationImage(
            image: NetworkImage(image ?? ''),
            fit: BoxFit.cover,
            filterQuality: FilterQuality.high,
          ),
        ),
      ),
    );
  }
}

class Top10 extends StatelessWidget {
  const Top10({
    super.key,
    required this.image,
    required this.movieId,
    this.index,
  });

  final String image;
  final int? index;
  final String? movieId;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push(RouteNames.detailPage);
        Api.movieId = movieId;
      },
      child: SizedBox(
        child: Stack(
          children: [
            Padding(
              padding: const EdgeInsets.only(
                bottom: 40,
                left: 15,
                right: 15,
              ),
              child: Container(
                height: 210,
                width: 145,
                decoration: BoxDecoration(
                  borderRadius: const BorderRadius.all(Radius.circular(16)),
                  image: DecorationImage(
                    image: NetworkImage(image),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Positioned(
              top: 120,
              child: Text(
                '${index! + 1}',
                style: AppStyle.fontStyle.copyWith(
                  foreground: Paint()
                    ..style = PaintingStyle.stroke
                    ..strokeWidth = 1
                    ..color = AppColors.blueColor,
                  fontSize: 96,
                  fontWeight: FontWeight.w600,
                  fontFamily: 'Montserrat-Regular',
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
