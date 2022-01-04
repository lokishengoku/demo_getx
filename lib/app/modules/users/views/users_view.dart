import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/users_controller.dart';

class UsersView extends GetView<UsersController> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('UsersView'),
        centerTitle: true,
      ),
      body: controller.obx(
        (data) => ListView.builder(
          padding: EdgeInsets.all(8),
          itemCount: data?.length,
          itemBuilder: (ctx, index) {
            return Card(
              child: Wrap(
                children: [
                  ListTile(
                      leading: CircleAvatar(
                        radius: 30,
                        backgroundImage: NetworkImage(
                          data![index].picture?.large ?? '',
                        ),
                      ),
                      title: Text(
                        (data[index].name?.title ?? '') +
                            " " +
                            (data[index].name?.first ?? '') +
                            " " +
                            (data[index].name?.last ?? ''),
                      ),
                      subtitle: Text(
                        data[index].email ?? '',
                        style: TextStyle(fontSize: 12),
                      ),
                      trailing: Text(
                        'Age: ' + (data[index].dob?.age).toString(),
                      )),
                ],
              ),
            );
          },
        ),
        onError: (error) => Center(
          child: Text(error.toString()),
        ),
      ),
    );
  }
}
