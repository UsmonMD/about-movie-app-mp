import 'package:flutter/material.dart';
import 'package:go_router/go_router.dart';
import 'package:movies_app/ui/routes/app_routes.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class CategoriesButtonWidget extends StatelessWidget {
  const CategoriesButtonWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(
        left: 17,
        right: 17,
      ),
      child: SizedBox(
        width: 400.5,
        height: 75,
        child: FloatingActionButton(
          focusNode: FocusNode(
            skipTraversal: false,
            canRequestFocus: false,
            descendantsAreFocusable: false,
            descendantsAreTraversable: false,
          ),
          focusColor: AppColors.transparentColor,
          focusElevation: 0,
          elevation: 0,
          splashColor: AppColors.transparentColor,
          heroTag: 'button-to-categories-page',
          backgroundColor: AppColors.buttonColor,
          shape: OutlineInputBorder(
            borderRadius: BorderRadius.circular(15),
            borderSide: BorderSide(
              width: 3,
              color: AppColors.buttonColor,
            ),
          ),
          onPressed: () {
            context.push(RouteNames.categoriesPage);
          },
          child: Text(
            'Категории',
            style: AppStyle.fontStyle.copyWith(
              fontSize: 25,
              fontWeight: FontWeight.bold,
            ),
          ),
        ),
      ),
    );
  }
}
