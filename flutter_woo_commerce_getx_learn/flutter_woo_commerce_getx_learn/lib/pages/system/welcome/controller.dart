import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class WelcomeController extends GetxController {
  WelcomeController();

  List<WelcomeModel>? items;

  // 当前位置
  int currentIndex = 0;

  // 是否显示开始按钮
  bool isShowStart = false;

  // slider控制器
  CarouselSliderController carouselController = CarouselSliderController();

  // 当前位置发生改变
  void onPageChanged(int index) {
    currentIndex = index;
    isShowStart = currentIndex == 2;
    update(["slider", 'bar']);
  }

  // 去首页
  void onToMain() {
    Get.offAllNamed(RouteNames.systemMain);
  }

  // 下一个
  void onNext() {
    carouselController.nextPage();
  }

  _initData() {
    items = [
      WelcomeModel(
        image: AssetsImages.welcome_1Png,
        title: LocaleKeys.welcomeOneTitle.tr,
        desc: LocaleKeys.welcomeOneDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_2Png,
        title: LocaleKeys.welcomeTwoTitle.tr,
        desc: LocaleKeys.welcomeTwoDesc.tr,
      ),
      WelcomeModel(
        image: AssetsImages.welcome_3Png,
        title: LocaleKeys.welcomeThreeTitle.tr,
        desc: LocaleKeys.welcomeThreeDesc.tr,
      ),
    ];

    update(["slider"]);
  }

  void onTap() {}

  // @override
  // void onInit() {
  //   super.onInit();
  // }

  @override
  void onReady() {
    super.onReady();

    // 设置已打开了App
    ConfigService().setAlreadyOpen();
    _initData();
  }

  // @override
  // void onClose() {
  //   super.onClose();
  // }
}
