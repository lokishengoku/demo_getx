import 'package:demo_getx/app/data/models/users_model.dart';
import 'package:demo_getx/app/data/providers/users_provider.dart';
import 'package:get/get.dart';

class UsersController extends GetxController with StateMixin<List<Results>> {
  @override
  void onInit() {
    super.onInit();
    UsersProvider().getUsers().then(
      (value) {
        change(value.results, status: RxStatus.success());
      },
      onError: (error) {
        change(
          null,
          status: RxStatus.error(error.toString()),
        );
      },
    );
  }
}
