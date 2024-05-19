import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class NotFoundBody extends StatelessWidget {
  const NotFoundBody({
    super.key,
    required this.asset,
    required this.textHeader,
    required this.textBody,
  });

  final String asset;
  final String textHeader;
  final String textBody;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        SizedBox(
          width: 76,
          height: 76,
          child: Image.asset(
            asset,
            fit: BoxFit.cover,
          ),
        ),
        const SizedBox(
          height: 1,
        ),
        Text(
          textHeader,
          style: AppStyle.fontStyle.copyWith(
            color: AppColors.blackColor,
            letterSpacing: 0.12,
          ),
        ),
        const SizedBox(height: 8),
        Text(
          textBody,
          style: AppStyle.fontStyle.copyWith(
            fontSize: 12,
            fontWeight: FontWeight.w500,
            letterSpacing: 0.12,
            color: AppColors.blackColor,
          ),
        ),
      ],
    );
  }
}
