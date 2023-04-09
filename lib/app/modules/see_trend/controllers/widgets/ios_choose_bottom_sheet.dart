import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class IosChooseBottomSheet extends StatelessWidget {
  const IosChooseBottomSheet({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return CupertinoActionSheet(
      actions: [
        CupertinoActionSheetAction(
          onPressed: () {
            Get.back(result: 1);
          },
          isDefaultAction: true,
          child: const Text('相册'),
        ),
        CupertinoActionSheetAction(
          onPressed: () {
            Get.back(result: 2);
          },
          isDefaultAction: true,
          child: const Text('拍照'),
        ),
      ],
      cancelButton: CupertinoActionSheetAction(
        onPressed: () {
          Get.back(result: 0);
        },
        isDestructiveAction: true,
        child: const Text('取消'),
      ),
    );
  }
}
