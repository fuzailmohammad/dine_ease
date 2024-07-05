import 'package:dine_ease/app/data/values/images.dart';
import 'package:dine_ease/app/data/values/strings.dart';
import 'package:dine_ease/app/routes/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class OnboardingController extends GetxController {
  //TODO: Implement OnboardingController
  PageController pageController = PageController();

  List<OnboardingDto> onboardingObject = [
    OnboardingDto(
        title: Strings.onboardingTitleOne,
        subtitle: Strings.onboardingSubtitleOne,
        imageUrl: Images.onboardingOne),
    OnboardingDto(
        title: Strings.onboardingTitleTwo,
        subtitle: Strings.onboardingSubtitleTwo,
        imageUrl: Images.onboardingTwo),
  ];

  final RxInt _currentPage = 0.obs;

  int get currentPage => _currentPage.value;

  void onTapNext(int index) {
    if (index == currentPage) {
      Get.offAllNamed(Routes.AUTH_LOGIN);
    }
    _currentPage.value = index;
    pageController.jumpToPage(index);
  }
}

class OnboardingDto {
  final String title;
  final String subtitle;
  final String imageUrl;

  OnboardingDto(
      {required this.title, required this.subtitle, required this.imageUrl});
}
