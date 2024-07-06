import 'package:dine_ease/app/data/models/dto/restaurant.dart';
import 'package:dine_ease/utils/helper/date_time_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:razorpay_flutter/razorpay_flutter.dart';

class BookingDetailController extends GetxController {

  final Restaurant restaurant = Get.arguments;
  late Razorpay _razorpay;

  final selectedDate = DateTime.now().obs;
  final selectedTime = TimeOfDay.now().obs;

  final selectedDateTime = DateTime.now().obs;

  @override
  void onInit() {
    super.onInit();
    _razorpay = Razorpay();
    _razorpay.on(Razorpay.EVENT_PAYMENT_SUCCESS, _handlePaymentSuccess);
    _razorpay.on(Razorpay.EVENT_PAYMENT_ERROR, _handlePaymentError);
  }

  @override
  void onClose() {
    _razorpay.clear();
    super.onClose();
  }

  void selectDate() async {
    final date = await DateTimePicker.pickDate(date: selectedDate.value);
    if (date != null) {
      selectedDate.value = date;
    }
    selectTime();
  }

  void selectTime() async {
    final time = await DateTimePicker.pickTime(time: selectedTime.value);
    if (time != null) {
      selectedTime.value = time;
    }
  }

  void startPayment() {
    var options = {
      'key': 'V8H6dpigK646pCwkSADpTVXX',
      'amount': 100, // Amount in paise
      'name': restaurant.name,
      'description': 'Booking for ${restaurant.name}',
      'prefill': {
        'contact': '8888888888',
        'email': 'test@razorpay.com',
      },
    };

    try {
      _razorpay.open(options);
    } catch (e) {
      Get.snackbar('Error', e.toString());
    }
  }

  void _handlePaymentSuccess(PaymentSuccessResponse response) {
    Get.dialog(
      AlertDialog(
        title: Text('Payment Successful'),
        content: Text('Payment ID: ${response.paymentId}'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }

  void _handlePaymentError(PaymentFailureResponse response) {
    Get.dialog(
      AlertDialog(
        title: Text('Payment Failed'),
        content: Text('Error: ${response.message}'),
        actions: [
          TextButton(
            onPressed: () => Get.back(),
            child: Text('OK'),
          ),
        ],
      ),
    );
  }


}
