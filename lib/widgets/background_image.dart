import 'package:dine_ease/app/data/values/images.dart';
import 'package:dine_ease/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BackgroundImage extends StatelessWidget {
  const BackgroundImage({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: AppColors.white,
        image: DecorationImage(
          image: AssetImage(Images.icBackgroundPattern),
          fit: BoxFit.cover,
        ),
      ),
      child:child,
    );
  }
}