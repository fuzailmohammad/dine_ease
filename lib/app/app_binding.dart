import 'package:dine_ease/app/app_controller.dart';
import 'package:dine_ease/app/data/repository/config_repository.dart';
import 'package:dine_ease/app/data/repository/user_repository.dart';
import 'package:get/get.dart';

class AppBinding extends Bindings {
  @override
  void dependencies() {
    Get.put(ConfigRepository(), permanent: true);
    Get.put(UserRepository(), permanent: true);
    Get.put(AppController(), permanent: true);
  }
}
