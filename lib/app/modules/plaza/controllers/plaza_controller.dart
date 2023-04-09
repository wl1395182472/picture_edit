import 'dart:async';

import 'package:get/get.dart';
import 'package:picture_edit/app/routes/app_pages.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

import '../model/trend.dart';

class PlazaController extends GetxController {
  static PlazaController? _controller;
  static PlazaController get to {
    _controller ??= Get.find<PlazaController>();
    return _controller!;
  }

  ///滚动控制器
  final refreshController = RefreshController();

  ///刷新时间间隔限制为1秒
  Timer? _tRefreshTimer;

  ///所有人的动态对象
  final trendList = <Trend>[].obs;

  @override
  void onInit() {
    onRefresh();
    super.onInit();
  }

  @override
  void onClose() {
    _controller = null;
    super.onClose();
    refreshController.dispose();
    _tRefreshTimer?.cancel();
  }

  ///分页刷新
  Future<bool> onRefresh() async {
    if (_tRefreshTimer?.isActive == true) {
      refreshController.refreshCompleted();
      return true;
    }
    _tRefreshTimer = Timer(1.seconds, () {});

    bool result = false;
    try {
      trendList.clear();
      trendList.addAll([
        Trend(
          userId: 0,
          userName: '张三',
          text: '今天办公',
          imageUrlList: [],
        ),
        Trend(
          userId: 1,
          userName: '李四',
          text: '明天办公',
          imageUrlList: [
            'https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2022%2F0514%2Feeb37601j00rbumhm000nc000hs00b4c.jpg&thumbnail=660x2147483647&quality=80&type=jpg',
            'https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2022%2F0514%2Feeb37601j00rbumhm000nc000hs00b4c.jpg&thumbnail=660x2147483647&quality=80&type=jpg',
            'https://nimg.ws.126.net/?url=http%3A%2F%2Fdingyue.ws.126.net%2F2022%2F0514%2Feeb37601j00rbumhm000nc000hs00b4c.jpg&thumbnail=660x2147483647&quality=80&type=jpg',
          ],
        ),
        Trend(
          userId: 2,
          userName: '王五',
          text: '后天办公',
          imageUrlList: [
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
            'https://t7.baidu.com/it/u=1924685446,1172056477&fm=193&f=GIF',
          ],
        ),
      ]);
      result = true;
    } finally {
      refreshController.refreshCompleted();
    }
    return result;
  }

  ///分页加载
  Future<void> onLoadMore() async {
    try {
      trendList.addAll([]);
    } finally {
      refreshController.loadFailed();
    }
  }

  ///查看动态
  void addTrend() {
    Get.toNamed(
      Routes.SEE_TREND,
      arguments: Trend(
        userId: 0,
        userName: '王二麻子',
        text: '',
        imageUrlList: [],
        canEdit: true,
      ),
    );
  }

  ///查看动态
  void seeTrend(Trend trend) {
    Get.toNamed(
      Routes.SEE_TREND,
      arguments: trend,
    );
  }
}
