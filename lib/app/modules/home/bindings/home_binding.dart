import 'package:dine_ease/app/modules/home/dashboard/controllers/dashboard_controller.dart';
import 'package:dine_ease/app/modules/home/maps/controllers/maps_controller.dart';
import 'package:dine_ease/app/modules/home/profile/controllers/profile_controller.dart';
import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(() => HomeController());
    Get.lazyPut<DashboardController>(
          () => DashboardController(),
    );
    Get.lazyPut<MapsController>(
          () => MapsController(),
    );
    Get.lazyPut<ProfileController>(
          () => ProfileController(),
    );
  }
}
