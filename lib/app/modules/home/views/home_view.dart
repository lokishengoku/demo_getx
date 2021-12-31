import 'package:demo_getx/generated/locales.g.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('HomeView'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Obx(
              () => Text(
                controller.count.toString(),
                style: TextStyle(fontSize: 20),
              ),
            ),
            ElevatedButton(
              onPressed: () async {
                var result = await Get.toNamed("/login");
                print(result);
              },
              child: Text(LocaleKeys.buttons_login.tr),
            ),
            ElevatedButton(
              onPressed: () {
                Get.snackbar(
                  "Snackbar Title",
                  "This is a snackbar",
                  icon: Icon(Icons.check),
                  shouldIconPulse: true,
                  onTap: (_sb) {
                    print("hoooyaaaaaa");
                  },
                  isDismissible: true,
                  duration: Duration(seconds: 3),
                );
              },
              child: Text(LocaleKeys.buttons_show_snackbar.tr),
            ),
            ElevatedButton(
              onPressed: () {
                Get.defaultDialog(
                  onConfirm: () {
                    print('ok');
                    Get.back();
                  },
                  middleText: 'dialog made in 3 lines of code',
                );
              },
              child: Text(LocaleKeys.buttons_show_dialog.tr),
            ),
            ElevatedButton(
              onPressed: () {
                Get.bottomSheet(
                  Container(
                    child: Wrap(
                      children: [
                        ListTile(
                          leading: Icon(Icons.music_note),
                          title: Text('Music'),
                          onTap: () {},
                        )
                      ],
                    ),
                  ),
                  backgroundColor: Colors.white,
                );
              },
              child: Text(LocaleKeys.buttons_show_bottom_sheet.tr),
            ),
            ElevatedButton(
              onPressed: () {
                var locale = Locale('vi_VN');
                Get.updateLocale(locale);
              },
              child: Text(LocaleKeys.buttons_change_language_vi.tr),
            ),
            ElevatedButton(
              onPressed: () {
                var locale = Locale('en_US');
                Get.updateLocale(locale);
              },
              child: Text(LocaleKeys.buttons_change_language_en.tr),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          controller.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
