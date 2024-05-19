import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/app_colors.dart';

abstract class AppStyle {
  static TextStyle fontStyle = TextStyle(
    color: AppColors.whiteColor,
    fontSize: 14,
    fontWeight: FontWeight.w400,
    fontStyle: FontStyle.normal,
  );
}
