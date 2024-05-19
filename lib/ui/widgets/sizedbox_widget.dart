import 'package:flutter/material.dart';

class SizedBoxHeightWidget extends StatelessWidget {
  const SizedBoxHeightWidget({super.key, required this.height});

  final double height;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
    );
  }
}

class SizedBoxWidthWidget extends StatelessWidget {
  const SizedBoxWidthWidget({super.key, required this.width});
  final double width;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: width,
    );
  }
}
