import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class TextMovieCard extends StatelessWidget {
  const TextMovieCard({super.key, required this.text, required this.icon});

  final String icon;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        SvgPicture.asset(icon, fit: BoxFit.cover),
        const SizedBox(width: 4),
        Text(
          text,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 12,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
