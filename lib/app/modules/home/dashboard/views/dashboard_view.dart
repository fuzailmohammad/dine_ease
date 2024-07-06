import 'package:dine_ease/app/data/values/strings.dart';
import 'package:dine_ease/app/theme/app_colors.dart';
import 'package:dine_ease/app/theme/styles.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/dashboard_controller.dart';

class DashboardView extends GetView<DashboardController> {
  const DashboardView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
            children: [
              const Text(
                Strings.findYouFavouriteRestaurant,
                style: Styles.tsPrimaryColorSemiBold20,
              ),
              Expanded(
                child: Obx(() {
                  if (controller.restaurantList.isEmpty) {
                    return const Center(
                        child: CupertinoActivityIndicator(
                      radius: 20,
                      color: AppColors.lightGreen,
                    ));
                  }
                  return GridView.builder(
                    padding: const EdgeInsets.symmetric(vertical: 10),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemCount: controller.restaurantList.length,
                    itemBuilder: (context, index) {
                      final restaurant = controller.restaurantList[index];
                      return RestaurantTab(
                        imageUrl: restaurant.image,
                        restaurantTitle: restaurant.name,
                        restaurantSubtitle: restaurant.address,
                        onTap: () => controller.goToRestaurant(index),
                      );
                    },
                  );
                }),
              )
            ],
          ),
        ),
      ),
    );
  }
}

class RestaurantTab extends StatelessWidget {
  const RestaurantTab({
    super.key,
    required this.imageUrl,
    required this.restaurantTitle,
    required this.restaurantSubtitle,
    required this.onTap,
  });

  final String imageUrl;
  final String restaurantTitle;
  final String restaurantSubtitle;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Container(
        padding: const EdgeInsets.all(10),
        width: Get.width / 2.5,
        decoration: BoxDecoration(
            boxShadow: kElevationToShadow[1],
            borderRadius: BorderRadius.circular(10),
            color: AppColors.white),
        child: Column(
          children: [
            Image.network(
              imageUrl,
              height: 80,
              width: 80,
            ),
            const SizedBox(
              height: 10,
            ),
            Text(
              restaurantTitle,
              style: Styles.tsPrimaryColorRegular18,
              textAlign: TextAlign.center,
            ),
            const SizedBox(
              height: 2.5,
            ),
            Text(
              restaurantSubtitle,
              style: Styles.tsPrimaryColorSemiLight14,
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
