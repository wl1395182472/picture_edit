import 'package:get/get.dart';

class LibraryController extends GetxController {
  static LibraryController? _controller;
  static LibraryController get to {
    _controller ??= Get.find<LibraryController>();
    return _controller!;
  }

  @override
  void onClose() {
    _controller = null;
    super.onClose();
  }
}
