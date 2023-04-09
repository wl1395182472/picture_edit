import 'package:get/get.dart';

class PersonalController extends GetxController {
  static PersonalController? _controller;
  static PersonalController get to {
    _controller ??= Get.find<PersonalController>();
    return _controller!;
  }

  @override
  void onClose() {
    _controller = null;
    super.onClose();
  }
}
