import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:dine_ease/app/data/models/dto/restaurant.dart';
import 'package:get/get.dart';

class DashboardController extends GetxController {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  var restaurantList = <Restaurant>[].obs;

  @override
  void onInit() {
    super.onInit();
    fetchRestaurants();
  }

  void fetchRestaurants() async {
    try {
      QuerySnapshot querySnapshot = await _firestore.collection('restaurants').get();
      restaurantList.value = querySnapshot.docs.map((doc) => Restaurant.fromJson(doc.data() as Map<String, dynamic>)).toList();
    } catch (e) {
      print("Error fetching restaurants: $e");
    }
  }

}
