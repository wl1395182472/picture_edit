import 'package:get/get.dart';

class FriendsController extends GetxController {
  static FriendsController? _controller;
  static FriendsController get to {
    _controller ??= Get.find<FriendsController>();
    return _controller!;
  }

  @override
  void onClose() {
    _controller = null;
    super.onClose();
  }
}
