import 'package:dine_ease/utils/helper/date_time_picker.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/booking_detail_controller.dart';

class BookingDetailView extends GetView<BookingDetailController> {
  const BookingDetailView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Booking Details'),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              controller.restaurant.name,
              style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            ),
            SizedBox(height: 16),
            Obx(() {
              return InkWell(
                onTap: controller.selectDate,
                child: Column(
                  children: [
                    Text(
                      'Selected Date & Time: ',
                      style: TextStyle(fontSize: 16),
                    ),
                    Text(
                      '${controller.selectedDateTime.value}',
                      style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                    ),
                  ],
                ),
              );
            }),
            SizedBox(height: 16),
            Obx(() {
              return Column(
                children: [
                  Text(
                    'Selected Date: ',
                    style: TextStyle(fontSize: 16),
                  ),
                  Text(
                    DateTimePicker.formatDate(controller.selectedDate.value),
                    style: TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              );
            }),
            SizedBox(height: 16),
            ElevatedButton(
              onPressed: controller.startPayment,
              child: Text('Pay & Book'),
            ),
          ],
        ),
      ),
    );
  }
}

