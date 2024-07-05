import 'package:dine_ease/app/modules/home/dashboard/views/dashboard_view.dart';
import 'package:dine_ease/app/modules/home/maps/views/maps_view.dart';
import 'package:dine_ease/app/modules/home/profile/views/profile_view.dart';
import 'package:dine_ease/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        children: [
          Expanded(
            child: PageView(
              onPageChanged: controller.switchTab,
              controller: controller.pageController,
              physics: const NeverScrollableScrollPhysics(),
              children: const [
                DashboardView(),
                MapsView(),
                ProfileView(),
              ],
            ),
          ),
          Card(
            margin: const EdgeInsets.fromLTRB(10, 0, 10, 10),
            color: AppColors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: List.generate(
                  controller.bottomBarIcons.length,
                  (index) {
                    return GestureDetector(
                      behavior: HitTestBehavior.opaque,
                      onTap: () => controller.switchTab(index),
                      child: Obx(
                        () => Image.asset(
                          controller.bottomBarIcons[index],
                          width: 30,
                          fit: BoxFit.fitWidth,
                          color: controller.selectedTab == index
                              ? AppColors.lightGreen
                              : AppColors.darkGrey,
                        ),
                      ),
                    );
                  },
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
