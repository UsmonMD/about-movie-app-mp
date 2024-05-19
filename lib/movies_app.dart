import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:movies_app/ui/routes/app_navigator.dart';

class MovieApp extends StatelessWidget {
  const MovieApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialAppWidget();
  }
}

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    final mQ = MediaQuery.of(context).size;
    return ScreenUtilInit(
      designSize: Size(
        mQ.width,
        mQ.height,
      ),
      child: MaterialApp.router(
        theme: ThemeData.dark(),
        debugShowCheckedModeBanner: false,
        routerConfig: AppRoutes.routes,
      ),
    );
  }
}
