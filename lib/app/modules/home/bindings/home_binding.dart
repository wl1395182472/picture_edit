import 'package:get/get.dart';
import 'package:picture_edit/app/modules/friends/controllers/friends_controller.dart';
import 'package:picture_edit/app/modules/library/controllers/library_controller.dart';
import 'package:picture_edit/app/modules/personal/controllers/personal_controller.dart';
import 'package:picture_edit/app/modules/plaza/controllers/plaza_controller.dart';

import '../controllers/home_controller.dart';

class HomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<HomeController>(
      () => HomeController(),
    );
    Get.lazyPut<PlazaController>(
      () => PlazaController(),
    );
    Get.lazyPut<LibraryController>(
      () => LibraryController(),
    );
    Get.lazyPut<FriendsController>(
      () => FriendsController(),
    );
    Get.lazyPut<PersonalController>(
      () => PersonalController(),
    );
  }
}
