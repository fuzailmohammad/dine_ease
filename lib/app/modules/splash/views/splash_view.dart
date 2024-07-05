import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../../widgets/app_icon_with_title.dart';
import '../../../../widgets/background_image.dart';
import '../controllers/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    return const Scaffold(
      body: BackgroundImage(
        child: Center(
          child: AppIconWithTitle(),
        ),
      ),
    );
  }
}

