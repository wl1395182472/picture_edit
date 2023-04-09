import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../global_widgets/user_avatar.dart';
import '../../../utils/tools.dart';
import '../controllers/see_trend_controller.dart';

class SeeTrendView extends GetView<SeeTrendController> {
  const SeeTrendView({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppbar(),
      body: SingleChildScrollView(
        child: Container(
          padding: EdgeInsets.only(
            bottom: MediaQuery.of(context).padding.bottom +
                MediaQuery.of(context).viewInsets.bottom,
          ),
          child: GestureDetector(
            onTap: () {
              FocusScope.of(context).unfocus();
            },
            behavior: HitTestBehavior.translucent,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
              child: buildBody(context),
            ),
          ),
        ),
      ),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text('动态'),
      centerTitle: true,
      actions: [
        Obx(
          () => controller.trend?.canEdit == true
              ? ElevatedButton(
                  onPressed: () {},
                  child: const Text('发送'),
                )
              : const SizedBox(),
        ),
        const SizedBox(width: 10.0),
      ],
    );
  }

  Widget buildBody(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      padding: const EdgeInsets.symmetric(
        horizontal: 15.0,
        vertical: 20.0,
      ),
      child: SizedBox(
        width: MediaQuery.of(context).size.width - 90.0,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10.0),
                  child: UserAvatar(userId: controller.trend?.userId),
                ),
                Obx(
                  () => Text(
                    controller.trend?.userName ?? '',
                    maxLines: 1,
                    style: const TextStyle(
                      fontSize: 18.0,
                      fontWeight: FontWeight.w600,
                    ),
                  ),
                ),
              ],
            ),
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 15.0),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 20.0),
                    child: Obx(
                      () => controller.trend?.canEdit == true
                          ? TextField(
                              controller: controller.textEditingController,
                              maxLines: null,
                              decoration: const InputDecoration(
                                border: InputBorder.none,
                                hintText: '请输入您的描述',
                              ),
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            )
                          : Text(
                              controller.trend?.text ?? '',
                              maxLines: null,
                              style: const TextStyle(
                                fontSize: 16.0,
                              ),
                            ),
                    ),
                  ),
                  Obx(
                    () => controller.trend?.canEdit == true
                        ? SizedBox(
                            width:
                                MediaQuery.of(context).size.width - 30.0 - 60.0,
                            child: Wrap(
                              direction: Axis.horizontal,
                              spacing: 10.0,
                              runSpacing: 5.0,
                              children: [
                                GestureDetector(
                                  onTap: () => controller.addImage(context),
                                  child: Container(
                                    width: 80.0,
                                    height: 80.0,
                                    alignment: Alignment.center,
                                    color: Colors.grey[100],
                                    child: const Icon(CupertinoIcons.add),
                                  ),
                                ),
                                ...controller.imagePathList.map(
                                  (imagePath) => GestureDetector(
                                    onTap: () =>
                                        MyTools.seeAssetPicture(imagePath),
                                    child: Image.file(
                                      File(imagePath),
                                      width: 80.0,
                                      height: 80.0,
                                      fit: BoxFit.none,
                                    ),
                                  ),
                                ),
                              ],
                            ),
                          )
                        : controller.trend?.imageUrlList.isNotEmpty == true
                            ? SizedBox(
                                width: MediaQuery.of(context).size.width -
                                    40.0 -
                                    60.0,
                                child: Wrap(
                                  direction: Axis.horizontal,
                                  spacing: 5.0,
                                  runSpacing: 5.0,
                                  children: controller.trend!.imageUrlList
                                      .map(
                                        (imageUrl) => GestureDetector(
                                          onTap: () =>
                                              MyTools.seeNetworkPicture(
                                                  imageUrl),
                                          child: Image.network(
                                            imageUrl,
                                            width: 80.0,
                                            height: 80.0,
                                            fit: BoxFit.none,
                                          ),
                                        ),
                                      )
                                      .toList(),
                                ),
                              )
                            : const SizedBox(),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
