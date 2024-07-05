import 'package:dine_ease/app/data/repository/user_repository.dart';
import 'package:dine_ease/app/routes/app_pages.dart';
import 'package:dine_ease/base/base_controller.dart';
import 'package:dine_ease/utils/helper/exception_handler.dart';
import 'package:dine_ease/utils/loading/loading_utils.dart';
import 'package:get/get.dart';

class ProfileController extends BaseController<UserRepository> {




  void onTapLogOut() async{
    try {
      LoadingUtils.showLoader();
      await repository.logout();
      LoadingUtils.hideLoader();
      Get.offAllNamed(Routes.AUTH_LOGIN);
    } catch (error) {
     HandleError.handleError(error.toString());
    }
  }

}
