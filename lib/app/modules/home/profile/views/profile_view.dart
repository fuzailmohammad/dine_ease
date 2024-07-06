import 'dart:math';

import 'package:dine_ease/app/data/values/strings.dart';
import 'package:dine_ease/app/theme/app_colors.dart';
import 'package:dine_ease/app/theme/styles.dart';
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
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(20),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                boxShadow: kElevationToShadow[1],
                gradient: const LinearGradient(colors: AppColors.primaryGradient)
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisSize: MainAxisSize.min,
                children: <Widget>[
                  CircleAvatar(radius: 60, foregroundImage: NetworkImage(controller.imageUrl),),
                  const SizedBox(height: 5,),
                  Text('Mohammad Fuzail',style: Styles.tsWhiteBold25,),
                  //Text(controller.name,style: Styles.tsWhiteBold25,),
                  const SizedBox(height: 10,),
                  Text(controller.email,style: Styles.tsWhiteRegular18,),

                ],
              ),
            ),
            const SizedBox(height: 20,),
            _buildSettingRow(
              onTap: (){},
              icon: Icons.table_bar_sharp,
              name: Strings.myBookings,
              buttonColor: AppColors.pastelPink,
            ),
            _buildSettingRow(
              onTap: (){},
              icon: Icons.touch_app,
              name: Strings.aboutUs,
              buttonColor: AppColors.pastelBlue,
            ),
          ],
        ),
      ),
    );
  }
}

Widget _buildSettingRow({
  required IconData icon,
  required String name,
  required Color buttonColor,
  required VoidCallback onTap,
}) {
  return SizedBox(
    height: 50,
    width: Get.width - 20,
    child: MaterialButton(
      elevation: 10,
      color: buttonColor.withOpacity(0.80),
      shape: RoundedRectangleBorder(
        //side: const BorderSide(color: AppColors.white, width: 0.35),
        borderRadius: BorderRadius.circular(10.0),
      ),
      padding: EdgeInsets.zero,
      onPressed: onTap,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          const SizedBox(),
          Text(
            name,
            textAlign: TextAlign.center,
            style: Styles.tsWhiteBold18,
          ),
          ClipPath(
            clipper: TiltedLeftEdgeClipper(),
            child: Container(
              width: 75,
              padding: const EdgeInsets.all(10),
              decoration: BoxDecoration(
                color: AppColors.white.withOpacity(0.70),
                borderRadius:
                const BorderRadius.horizontal(right: Radius.circular(10)),
              ),
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(icon, size: 30,color: AppColors.darkGreen,),
              ),
            ),
          ),
        ],
      ),
    ),
  ).paddingSymmetric(vertical: 5);
}

class TiltedLeftEdgeClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    final path = Path();
    path.moveTo(0, 0);
    path.lineTo(size.width, 0);
    path.lineTo(size.width, size.height);
    path.lineTo(0, size.height);

    // Calculating the tilt point
    final tiltX = size.height / tan(65 * pi / 180); // 45 degrees in radians
    path.lineTo(tiltX, 0);
    path.close();
    return path;
  }

  @override
  bool shouldReclip(covariant CustomClipper<Path> oldClipper) {
    return false;
  }
}
