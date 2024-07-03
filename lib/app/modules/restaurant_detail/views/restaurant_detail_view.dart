import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/restaurant_detail_controller.dart';

class RestaurantDetailView extends GetView<RestaurantDetailController> {
  const RestaurantDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('RestaurantDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'RestaurantDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
