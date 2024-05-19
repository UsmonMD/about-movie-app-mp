// import 'package:flutter/material.dart';
// import 'package:movies_app/ui/theme/app_colors.dart';

// class TextFieldWidget extends StatelessWidget {
//   const TextFieldWidget({
//     super.key,
//     required this.secured,
//     required this.hintText,
//     required this.controller,
//   });
//   final bool secured;

//   final String hintText;
//   final TextEditingController controller;

//   @override
//   Widget build(BuildContext context) {
//     return Container(
//       width: 330,
//       height: 50,
//       decoration: BoxDecoration(
//         borderRadius: BorderRadius.circular(15),
//         color: AppColors.btbBorderColor,
//       ),
//       child: Center(
//         child: TextFormField(
//           controller: TextEditingController(),
//           decoration: InputDecoration(
//             filled: true,
//             hintText: hintText,
//             fillColor: AppColors.whiteColor,
//             focusColor: AppColors.whiteColor,
//             hintStyle: TextStyle(
//               fontSize: 20,
//               fontFamily: 'Poppins',
//               fontWeight: FontWeight.w400,
//               color: AppColors.darkBlueColor,
//             ),
//             enabledBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.darkBlueColor,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(
//                 14,
//               ),
//             ),
//             focusedBorder: OutlineInputBorder(
//               borderSide: BorderSide(
//                 color: AppColors.darkBlueColor,
//                 width: 1,
//               ),
//               borderRadius: BorderRadius.circular(14),
//             ),
//             contentPadding: const EdgeInsets.symmetric(
//               horizontal: 20,
//               vertical: 10,
//             ),
//           ),
//           obscureText: secured,
//           obscuringCharacter: '●',
//         ),
//       ),
//     );
//   }
// }
import 'package:flutter/material.dart';
import 'package:movies_app/ui/theme/app_colors.dart';
import 'package:movies_app/ui/theme/app_style.dart';

class MyTextFieldWidget extends StatelessWidget {
  const MyTextFieldWidget({
    super.key,
    this.obsecureText,
    required this.hintText,
    required this.labelText,
    required this.controller,
  });

  final String hintText;
  final String labelText;
  final TextEditingController controller;
  final bool? obsecureText;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColors.bgColor,
      width: 400,
      height: 50,
      child: TextFormField(
        obscuringCharacter: '●',
        obscureText: obsecureText ?? false,
        controller: controller,
        keyboardType: TextInputType.emailAddress,
        style: AppStyle.fontStyle.copyWith(
          color: AppColors.whiteColor,
        ),
        cursorColor: AppColors.greenColor,
        decoration: InputDecoration(
          enabledBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.bgColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          focusedBorder: OutlineInputBorder(
            borderSide: BorderSide(
              color: AppColors.greenColor,
              width: 3,
            ),
            borderRadius: BorderRadius.circular(7),
          ),
          hintText: hintText,
          labelText: labelText,
          labelStyle: AppStyle.fontStyle.copyWith(
            color: AppColors.whiteColor,
          ),
          hintStyle: AppStyle.fontStyle.copyWith(
            color: AppColors.whiteColor,
          ),
        ),
      ),
    );
  }
}
