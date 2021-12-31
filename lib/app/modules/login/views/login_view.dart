import 'package:demo_getx/app/modules/home/controllers/home_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  final HomeController _homeController = Get.find();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('LoginView'),
        centerTitle: true,
      ),
      body: Container(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              _homeController.count.toString(),
              style: TextStyle(fontSize: 20),
            ),
            // Text(Get.parameters['data'] ?? 'null'),
            ElevatedButton(
              onPressed: () {
                Get.back(result: 'data return');
              },
              child: Text("Return data to the previous screen"),
            )
          ],
        ),
      ),
    );
  }
}
