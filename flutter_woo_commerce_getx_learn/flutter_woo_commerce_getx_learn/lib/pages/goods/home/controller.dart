import 'package:flutter_woo_commerce_getx_learn/common/api/system.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeController();

  // 导航点击事件
  void onAppBarTap() {}

  // Banner 当前索引
  int bannerCurrentIndex = 0;
  // Banner 数据
  List<KeyValueModel> bannerItems = [];

  // Banner 点击事件
  void onChangeBanner(int index, reason) {
    bannerCurrentIndex = index;
    update(["home_banner"]);
  }

  _initData() async {

    // 首页
    // Banner
    bannerItems = await SystemApi.banners();

    update(["home"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
