import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class LoginButton extends StatelessWidget {
  const LoginButton({
    super.key,
    required this.text,
    required this.onPressed,
  });

  final String text;
  final void Function() onPressed;

  @override
  Widget build(BuildContext context) {
    final mq = MediaQuery.of(context);
    return Material(
      elevation: 5.0,
      borderRadius: BorderRadius.circular(25),
      color: AppColors.greenColor,
      child: SizedBox(
        height: 50,
        child: MaterialButton(
          shape: OutlineInputBorder(
            borderSide: BorderSide.none,
            borderRadius: BorderRadius.circular(
              20,
            ),
          ),
          color: AppColors.greenColor,
          minWidth: mq.size.width,
          onPressed: onPressed,
          child: Text(
            text,
            textAlign: TextAlign.center,
            style: AppStyle.fontStyle,
          ),
        ),
      ),
    );
  }
}
