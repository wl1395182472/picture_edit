import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:picture_edit/app/modules/plaza/views/widgets.dart/trend_view.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../controllers/plaza_controller.dart';

class PlazaView extends GetView<PlazaController> {
  const PlazaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: buildAppbar(),
      body: buildBody(),
    );
  }

  AppBar buildAppbar() {
    return AppBar(
      title: const Text('广场'),
      centerTitle: true,
      actions: [
        IconButton(
          onPressed: controller.addTrend,
          icon: const Icon(CupertinoIcons.add),
        ),
      ],
    );
  }

  Widget buildBody() {
    return Obx(
      () => Scrollbar(
        child: SmartRefresher(
          enablePullDown: true,
          enablePullUp: true,
          onRefresh: controller.onRefresh,
          onLoading: controller.onLoadMore,
          controller: controller.refreshController,
          header: const WaterDropHeader(
            complete: SizedBox(),
            failed: Text(
              '刷新失败',
              maxLines: 1,
              style: TextStyle(color: Colors.grey),
            ),
            completeDuration: Duration(seconds: 0),
          ),
          footer: const ClassicFooter(
            loadStyle: LoadStyle.ShowWhenLoading,
            loadingText: '',
            failedText: '',
            idleText: '',
            noDataText: '',
            loadingIcon: null,
            idleIcon: null,
          ),
          child: ListView.separated(
            separatorBuilder: (context, index) =>
                Divider(color: Colors.grey[200]),
            itemCount: controller.trendList.length,
            itemBuilder: (context, index) => GestureDetector(
              onTap: () => controller.seeTrend(controller.trendList[index]),
              behavior: HitTestBehavior.translucent,
              child: TrendView(
                trend: controller.trendList[index],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
