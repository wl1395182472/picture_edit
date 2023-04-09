import 'dart:io';

import 'package:flutter/material.dart';
import 'package:get/get.dart';

class MyTools {
  static void seeAssetPicture(String imagePath) {
    Get.dialog(
      GestureDetector(
        onTap: Get.back,
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: Image.file(
            File(imagePath),
          ),
        ),
      ),
    );
  }

  static void seeNetworkPicture(String imageUrl) {
    Get.dialog(
      GestureDetector(
        onTap: Get.back,
        behavior: HitTestBehavior.translucent,
        child: Center(
          child: Image.network(
            imageUrl,
          ),
        ),
      ),
    );
  }
}
