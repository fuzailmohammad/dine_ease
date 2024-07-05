import 'package:dine_ease/app/data/values/images.dart';
import 'package:dine_ease/app/data/values/strings.dart';
import 'package:dine_ease/app/modules/auth/login/controllers/auth_login_controller.dart';
import 'package:dine_ease/app/theme/app_colors.dart';
import 'package:dine_ease/app/theme/styles.dart';
import 'package:dine_ease/widgets/app_icon_with_title.dart';
import 'package:dine_ease/widgets/background_image.dart';
import 'package:dine_ease/widgets/buttons/primary_filled_button.dart';
import 'package:dine_ease/widgets/text_field/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AuthLoginView extends GetView<AuthLoginController> {
  const AuthLoginView({super.key});

  @override
  Widget build(BuildContext context) {
    return BackgroundImage(
      child: Scaffold(
        backgroundColor: Colors.transparent,
        body: SafeArea(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(24.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                const AppIconWithTitle(),
                const SizedBox(
                  height: 20,
                ),
                CustomTextField(
                  wrapper: controller.emailWrapper,
                  hintText: Strings.email,
                  inputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 5,
                ),
                CustomTextField(
                  wrapper: controller.passwordWrapper,
                  hintText: Strings.password,
                  inputType: TextInputType.text,
                ),
                const SizedBox(height: 20.0),
                const Text(
                  Strings.continueWith,
                  style: Styles.tsPrimaryColorBold14,
                ),
                const SizedBox(height: 20.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    WhiteButton(
                      title: Strings.facebook,
                      imageUrl: Images.icFacebook,
                      onTap: controller.loginWithFacebook,
                    ),
                    WhiteButton(
                      title: Strings.goggle,
                      imageUrl: Images.icGoogle,
                      onTap: controller.loginWithGoogle,
                    ),
                  ],
                ),
                const SizedBox(height: 40.0),
                SizedBox(
                  width: Get.width / 2.5,
                  child: PrimaryFilledButton(
                    text: Strings.login,
                    onTap: controller.loginWithEmail,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class WhiteButton extends StatelessWidget {
  const WhiteButton({
    super.key,
    required this.title,
    required this.imageUrl,
    required this.onTap,
  });

  final String title;
  final String imageUrl;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: onTap,
      child: Ink(
        width: Get.width / 3,
        height: 50,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.0),
          color: AppColors.white,
          boxShadow: kElevationToShadow[1],
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.asset(imageUrl),
            Text(title),
          ],
        ),
      ),
    );
  }
}
