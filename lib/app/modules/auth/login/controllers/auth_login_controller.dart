import 'package:dine_ease/app/data/repository/user_repository.dart';
import 'package:dine_ease/app/data/values/strings.dart';
import 'package:dine_ease/app/routes/app_pages.dart';
import 'package:dine_ease/base/base_controller.dart';
import 'package:dine_ease/utils/helper/exception_handler.dart';
import 'package:dine_ease/utils/helper/text_field_wrapper.dart';
import 'package:dine_ease/utils/loading/loading_utils.dart';
import 'package:get/get.dart';

class AuthLoginController extends BaseController<UserRepository> {
  final emailWrapper = TextFieldWrapper();
  final passwordWrapper = TextFieldWrapper();

  void loginWithGoogle() async {
    try {
      LoadingUtils.showLoader();
      bool isSuccess = await repository.loginWithGoogle();
      LoadingUtils.hideLoader();
      if (isSuccess) {
        Get.offAllNamed(Routes.HOME);
      } else {
        LoadingUtils.hideLoader();
        HandleError.handleError("Google login failed");
      }
    } catch (error) {
      LoadingUtils.hideLoader();
      HandleError.handleError(error.toString());
    }
  }

  void loginWithFacebook() async {
    try {
      LoadingUtils.showLoader();
      bool isSuccess = await repository.loginWithFacebook();
      LoadingUtils.hideLoader();
      if (isSuccess) {
        Get.offAllNamed(Routes.HOME);
      } else {
        LoadingUtils.hideLoader();
        HandleError.handleError("Facebook login failed");
      }
    } catch (error) {
      LoadingUtils.hideLoader();
      HandleError.handleError(error.toString());
    }
  }

  void loginWithEmail() async {
    if (emailWrapper.controller.text.isNotEmpty) {
      emailWrapper.errorText = ErrorMessages.invalidEmail;
      return;
    } else {
      emailWrapper.errorText = Strings.empty;
    }
    try {
      LoadingUtils.showLoader();
      bool isSuccess = await repository.loginWithEmail(
        emailWrapper.controller.text.trim(),
        passwordWrapper.controller.text.trim(),
      );
      LoadingUtils.hideLoader();
      if (isSuccess) {
        Get.offAllNamed(Routes.HOME);
      } else {
        LoadingUtils.hideLoader();
        HandleError.handleError("Email login failed");
      }
    } catch (error) {
      LoadingUtils.hideLoader();
      HandleError.handleError(error.toString());
    }
  }
}
