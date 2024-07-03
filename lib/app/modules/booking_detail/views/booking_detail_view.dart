import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_detail_controller.dart';

class BookingDetailView extends GetView<BookingDetailController> {
  const BookingDetailView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('BookingDetailView'),
        centerTitle: true,
      ),
      body: const Center(
        child: Text(
          'BookingDetailView is working',
          style: TextStyle(fontSize: 20),
        ),
      ),
    );
  }
}
