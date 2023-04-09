import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picture_edit/app/modules/plaza/controllers/plaza_controller.dart';
import 'package:picture_edit/app/routes/app_pages.dart';

class HomeController extends GetxController {
  static HomeController? _controller;
  static HomeController get to {
    _controller ??= Get.find<HomeController>();
    return _controller!;
  }

  ///PageView控制器
  final pageViewController = PageController();

  ///当前页面索引
  final _pageIndex = 0.obs;
  int get pageIndex => _pageIndex.value;
  set pageIndex(int value) => _pageIndex.value = value;

  @override
  void onClose() {
    _controller = null;
    super.onClose();
    pageViewController.dispose();
  }

  ///底部导航栏按钮点击
  void onClickBottomBar(int index) {
    pageViewController.jumpToPage(index);
    switch (index) {
      //广场
      case 0:
        PlazaController.to.onRefresh();
        break;
      //资源库
      case 1:
        break;
      //朋友
      case 2:
        break;
      //个人
      case 3:
        break;
      default:
        break;
    }
  }

  ///创建新图片
  void add() async {
    await Get.toNamed(Routes.ADD);
  }
}
