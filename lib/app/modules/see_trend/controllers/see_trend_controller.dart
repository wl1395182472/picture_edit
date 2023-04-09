import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';
import 'package:picture_edit/app/modules/plaza/model/trend.dart';
import 'package:picture_edit/app/utils/image_pick.dart';

import 'widgets/ios_choose_bottom_sheet.dart';

class SeeTrendController extends GetxController {
  ///当前的动态
  final _trend = Rx<Trend?>(null);
  Trend? get trend => _trend.value;
  set trend(Trend? value) => _trend.value = value;

  ///编辑中动态的描述
  final textEditingController = TextEditingController();

  ///编辑中动态的图片
  final imagePathList = <String>[].obs;

  @override
  void onInit() {
    initData();
    super.onInit();
  }

  @override
  void onClose() {
    super.onClose();
    textEditingController.dispose();
  }

  ///初始化数据
  void initData() {
    final result = Get.arguments;
    if (result is Trend) {
      trend = result;
    }
  }

  ///添加图片
  void addImage(BuildContext context) async {
    final result = await showCupertinoModalPopup(
      context: context,
      builder: (context) => const IosChooseBottomSheet(),
    );
    if (result is int) {
      switch (result) {
        case 0:
          break;
        case 1:
          final imageFile = await ImagePick.getImageFromGallery();
          if (imageFile != null) {
            imagePathList.add(imageFile.path);
          }
          break;
        case 2:
          final imageFile = await ImagePick.getImageFromCamera();
          if (imageFile != null) {
            imagePathList.add(imageFile.path);
          }
          break;
        default:
          break;
      }
    }
  }
}
