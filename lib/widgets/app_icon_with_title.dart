import 'package:dine_ease/app/data/values/images.dart';
import 'package:flutter/material.dart';

import '../app/data/values/strings.dart';
import '../app/theme/app_colors.dart';
import '../app/theme/styles.dart';

class AppIconWithTitle extends StatelessWidget {
  const AppIconWithTitle({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Image.asset(Images.logoTransparent),
        ShaderMask(
          shaderCallback: (bounds) {
            return const LinearGradient(
              colors: AppColors.primaryGradient,
              begin: Alignment.topLeft,
              end: Alignment.bottomRight,
            ).createShader(Rect.fromLTWH(0, 0, bounds.width, bounds.height));
          },
          child: const Text(
            Strings.appName,
            style: Styles.tsWhiteBold25,
            textAlign: TextAlign.center,
          ),
        ),
        const Text(
          Strings.appSubtitle,
          style: Styles.tsPrimaryColorSemiBold14,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}