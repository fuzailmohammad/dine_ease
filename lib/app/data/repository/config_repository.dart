import 'package:dine_ease/app/data/models/response/app_config_response.dart';
import 'package:dine_ease/app/data/values/urls.dart';
import 'package:dine_ease/base/base_repository.dart';
import 'package:dine_ease/utils/helper/exception_handler.dart';
import 'package:dine_ease/utils/storage/storage_utils.dart';

class ConfigRepository extends BaseRepository {
  saveAppConfig() async {
    final response = await controller.get(path: URLs.appConfig);
    if (response is! APIException) {
      Storage.setAppConfig(AppConfigResponse.fromJson(response).data);
    }
  }
}
