import 'package:analog_clock_test/service/notification_service.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'app/routes/app_pages.dart';
import 'assets/locales/localization.g.dart' as gen_localization;

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  NotificationService.onInit();
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      themeMode: ThemeMode.light,
      locale: Locale('en', ''),
      fallbackLocale: const Locale('en', ''),
      translations: gen_localization.Localization(),
    ),
  );
}
