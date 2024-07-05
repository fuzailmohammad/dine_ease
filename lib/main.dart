import 'package:dine_ease/app/app.dart';
import 'package:dine_ease/firebase_options.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

void main() async {
  await initGetStorage();
  WidgetsFlutterBinding.ensureInitialized();
  await Get.putAsync(
    () => Firebase.initializeApp(
      options: DefaultFirebaseOptions.currentPlatform,
    ),
  );
  runApp(const App());
}

Future initGetStorage() async {
  await GetStorage.init();
}
