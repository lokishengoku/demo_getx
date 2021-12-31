import 'package:demo_getx/app/modules/login/views/login_view.dart';
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
              child: Text("Go to login"),
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
              child: Text('Show snackbar'),
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
              child: Text('Show dialog'),
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
              child: Text('Show bottomsheet'),
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
