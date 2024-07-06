import 'package:dine_ease/app/data/models/dto/restaurant.dart';
import 'package:dine_ease/app/routes/app_pages.dart';
import 'package:get/get.dart';

class RestaurantDetailController extends GetxController {
  final Restaurant restaurant = Get.arguments;

  void onTapBooking() {
    Get.toNamed(Routes.BOOKING_DETAIL, arguments: restaurant);
  }
}
