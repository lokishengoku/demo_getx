import 'package:demo_getx/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      locale: Locale('en_US'),
      translationsKeys: AppTranslation.translations,
      routingCallback: (routing) {
        if (routing?.current == '/login') {
          print('trigger an action');
        }
      },
    ),
  );
}
