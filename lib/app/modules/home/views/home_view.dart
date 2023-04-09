import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picture_edit/app/modules/friends/views/friends_view.dart';
import 'package:picture_edit/app/modules/library/views/library_view.dart';
import 'package:picture_edit/app/modules/personal/views/personal_view.dart';
import 'package:picture_edit/app/modules/plaza/views/plaza_view.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: buildBody(),
      bottomNavigationBar: buildBottomBar(),
      floatingActionButton: buildFloatButton(),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerDocked,
    );
  }

  Widget buildBody() {
    return PageView(
      scrollDirection: Axis.horizontal,
      physics: const NeverScrollableScrollPhysics(),
      controller: controller.pageViewController,
      children: const [
        PlazaView(),
        LibraryView(),
        FriendsView(),
        PersonalView(),
      ],
      onPageChanged: (value) => controller.pageIndex = value,
    );
  }

  Widget buildBottomBar() {
    return Obx(
      () => BottomNavigationBar(
        type: BottomNavigationBarType.fixed,
        currentIndex: controller.pageIndex,
        onTap: controller.onClickBottomBar,
        items: const [
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.star_circle),
            label: '广场',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.photo),
            label: '资源库',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_3_fill),
            label: '朋友',
          ),
          BottomNavigationBarItem(
            icon: Icon(CupertinoIcons.person_alt),
            label: '个人',
          ),
        ],
      ),
    );
  }

  Widget buildFloatButton() {
    return FloatingActionButton(
      onPressed: controller.add,
      tooltip: 'Add New',
      child: const Icon(CupertinoIcons.add),
    );
  }
}
