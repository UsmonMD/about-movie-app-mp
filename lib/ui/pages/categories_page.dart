import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/theme/app_colors.dart';

class CategoriesPage extends StatelessWidget {
  const CategoriesPage({super.key});
  final String link =
      'https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcQdUMBlUAh4WZbdtMtoVm26JyxjihhMj1QdXYP5Lk4LVw&s';
  static List<String> categoriesNames = [
    'Now Playing',
    'Popular',
    'Top Rated',
    'Upcoming',
  ];
  static List<String> routeNamesList = [
    RouteNames.nowPlayingPage,
    RouteNames.popularPage,
    RouteNames.topRatedPage,
    RouteNames.upcomingPage,
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: AppColors.bgColor,
        leading: MaterialButton(
          onPressed: () {
            context.go(RouteNames.mainPage);
          },
          child: const Icon(Icons.arrow_back_ios),
        ), 
      ),
      body: Center(
        child: Container(
          color: AppColors.bgColor,
          child: Center(
            child: ListView.builder(
              physics: const NeverScrollableScrollPhysics(),
              itemCount: 4,
              itemBuilder: ((context, index) {
                return Container(
                  width: 375,
                  height: 192,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(
                      15,
                    ),
                  ),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 20.0,
                      vertical: 10,
                    ),
                    child: TextButton(
                      onPressed: () {
                        context.pushNamed(
                          routeNamesList[index],
                        );
                      },
                      style: ButtonStyle(
                        splashFactory: NoSplash.splashFactory,
                        backgroundColor: WidgetStatePropertyAll(
                          AppColors.buttonColor,
                        ),
                        shape: WidgetStatePropertyAll<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                            side: BorderSide(
                              width: 2,
                              color: AppColors.buttonColor,
                            ),
                            borderRadius: BorderRadius.circular(
                              15,
                            ),
                          ),
                        ),
                      ),
                      child: Center(
                        child: Text(
                          categoriesNames[index],
                          style: TextStyle(
                            fontSize: 50,
                            color: AppColors.whiteColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
            ),
          ),
        ),
      ),
    );
  }
}
