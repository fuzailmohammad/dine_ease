import 'package:dine_ease/app/data/values/strings.dart';
import 'package:dine_ease/app/theme/styles.dart';
import 'package:dine_ease/widgets/buttons/primary_filled_button.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/onboarding_controller.dart';

class OnboardingView extends GetView<OnboardingController> {
  const OnboardingView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisSize: MainAxisSize.max,
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Expanded(
              child: PageView.builder(
                  controller: controller.pageController,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.onboardingObject.length,
                  itemBuilder: (context, index) {
                    return OnboardingWidget(
                      onboardingObject: controller.onboardingObject[index],
                    );
                  }),
            ),
            Container(
              margin: const EdgeInsets.only(bottom: 20),
              width: Get.width / 2.5,
              child: PrimaryFilledButton(
                text: Strings.next,
                onTap: () => controller.onTapNext(1),
              ),
            )
          ],
        ),
      ),
    );
  }
}

class OnboardingWidget extends StatelessWidget {
  const OnboardingWidget({
    super.key,
    required this.onboardingObject,
  });

  final OnboardingDto onboardingObject;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Image.asset(onboardingObject.imageUrl),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 25.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text(
                onboardingObject.title,
                style: Styles.tsPrimaryColorSemiBold20,
                textAlign: TextAlign.center,
              ),
              Text(
                onboardingObject.subtitle,
                style: Styles.tsPrimaryColorRegular18,
                textAlign: TextAlign.center,
              ),
            ],
          ),
        ),
      ],
    );
  }
}
