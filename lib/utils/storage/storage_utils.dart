import 'package:dine_ease/app/data/models/dto/user.dart';
import 'package:dine_ease/app/data/models/response/app_config_response.dart';
import 'package:get_storage/get_storage.dart';

class Storage {
  Storage._privateConstructor();

  static final _box = GetStorage();

  static AppConfig getAppConfig() =>
      AppConfig.fromJson(_box.read(StorageKeys.APP_CONFIG));

  static void setAppConfig(AppConfig appConfig) =>
      _box.write(StorageKeys.APP_CONFIG, appConfig.toJson());

  static User getUser() => User.fromJson(_box.read(StorageKeys.USER));

  static void clearUser() => _box.remove(StorageKeys.USER);

  static void setUser(User? user) =>
      _box.write(StorageKeys.USER, user?.toJson());

  static bool isUserExists() => _box.read(StorageKeys.USER) != null;
}

class StorageKeys {
  StorageKeys._privateConstructor();

  static const APP_CONFIG = 'app_config';
  static const USER = 'user';
}
