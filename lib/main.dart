import 'package:flutter/material.dart';

import 'package:get/get.dart';

import 'app/routes/app_pages.dart';

void main() {
  runApp(
    GetMaterialApp(
      title: "Application",
      initialRoute: AppPages.INITIAL,
      getPages: AppPages.routes,
      routingCallback: (routing) {
        if (routing?.current == '/login') {
          print('trigger an action');
        }
      },
    ),
  );
}
