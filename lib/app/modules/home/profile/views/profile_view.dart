import 'package:dine_ease/app/theme/app_colors.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../controllers/profile_controller.dart';

class ProfileView extends GetView<ProfileController> {
  const ProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Profile'),
        centerTitle: true,
        actions: [
          IconButton(
            onPressed: controller.onTapLogOut,
            icon: const Icon(CupertinoIcons.power),
            color: AppColors.lightGreen,
          ),
        ],
      ),
      body: Column(
        children: [
          CircleAvatar()
        ],
      ),
    );
  }
}
