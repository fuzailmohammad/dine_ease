import 'package:dine_ease/app/data/values/strings.dart';
import 'package:dine_ease/utils/custom_snackbar.dart';

import '../../app/theme/app_colors.dart';

class HandleError {
  HandleError._privateConstructor();

  static handleError(String? error) {
    showCustomSnackbar(
        Strings.error, error ?? ErrorMessages.networkGeneral, AppColors.red);
  }
}
