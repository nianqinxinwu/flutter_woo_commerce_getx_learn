import 'package:get/get.dart';

import 'package:flutter_woo_commerce_getx_learn/common/index.dart';

class StylesIndexController extends GetxController {
  StylesIndexController();

// 语言切换
onLanguageSelected() {
  var en = Translation.supportedLocales[0];
  var zh = Translation.supportedLocales[1];

  ConfigService.to.onLocaleUpdate(
    ConfigService.to.locale.toLanguageTag() == en.toLanguageTag()
       ? zh
        : en,
  );
  update(["styles_index"]);
}

// 主题切换
onThemeSelected() async {
  await ConfigService.to.switchThemeModel();
  update(["styles_index"]);
}

  _initData() {
    update(["styles_index"]);
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
