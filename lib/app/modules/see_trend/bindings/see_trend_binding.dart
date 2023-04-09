import 'package:get/get.dart';

import '../controllers/see_trend_controller.dart';

class SeeTrendBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<SeeTrendController>(
      () => SeeTrendController(),
    );
  }
}
