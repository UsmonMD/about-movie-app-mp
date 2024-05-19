import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:movies_app/movies_app.dart';
import 'package:movies_app/ui/theme/app_colors.dart';

void main() async {
  SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(statusBarColor: AppColors.bgColor));
  runApp(
    const MovieApp(),
  );
}
