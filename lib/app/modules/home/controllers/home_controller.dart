import 'package:dine_ease/app/data/values/images.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  final PageController pageController = PageController();
  final List<String> bottomBarIcons = [
    Images.icHome,
    Images.icMaps,
    Images.icProfile,
  ];
  final RxInt _selectedTab = 0.obs;

  int get selectedTab => _selectedTab.value;

  void switchTab(int index) {
    if (index == selectedTab) return;
    _selectedTab.value = index;
    pageController.jumpToPage(index);
  }
}
