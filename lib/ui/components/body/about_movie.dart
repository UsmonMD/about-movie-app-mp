import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class AboutMovie extends StatelessWidget {
  const AboutMovie({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 29),
      child: SizedBox(
        width: 295,
        height: 87,
        child: Text(
          'From DC Comics comes the Suicide Squad, an antihero team of incarcerated supervillains who act as deniable assets for the United States government, undertaking high-risk black ops missions in exchange for commuted prison sentences.',
          style: AppStyle.fontStyle.copyWith(
            fontSize: 12,
            color: AppColors.blackColor,
          ),
        ),
      ),
    );
  }
}
