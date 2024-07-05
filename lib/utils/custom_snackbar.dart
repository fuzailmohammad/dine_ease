
import 'package:dine_ease/app/theme/app_colors.dart';
import 'package:dine_ease/app/theme/styles.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

void showCustomSnackbar(String title, String message, Color color) {
  Get.snackbar(
    title,
    message,
    snackPosition: SnackPosition.BOTTOM,
    backgroundColor: color,
    colorText: AppColors.white,
    borderRadius: 12,
    margin: const EdgeInsets.all(10),
    padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
    duration: const Duration(seconds: 3),
    animationDuration: const Duration(milliseconds: 300),
    isDismissible: true,
    forwardAnimationCurve: Curves.elasticInOut,
    reverseAnimationCurve: Curves.elasticInOut,
    overlayColor: Colors.black87.withOpacity(0.7),
    overlayBlur: 2,
    icon: const Icon(
      Icons.error,
      color: AppColors.white,
    ),
    shouldIconPulse: true,
    maxWidth: 500,
    snackStyle: SnackStyle.FLOATING,
    titleText: Text(
      title,
      style: Styles.tsWhiteRegular18,
    ),
    messageText: Text(
      message,
      style: Styles.tsWhiteRegular16,
    ),
  );
}
