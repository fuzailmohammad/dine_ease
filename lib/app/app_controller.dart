import 'package:dine_ease/app/data/repository/config_repository.dart';
import 'package:dine_ease/base/base_controller.dart';

class AppController extends BaseController<ConfigRepository> {
  @override
  void onInit() {
    super.onInit();
    repository.saveAppConfig();
  }
}
