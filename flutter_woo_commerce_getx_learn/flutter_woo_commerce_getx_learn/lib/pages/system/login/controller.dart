import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  LoginController();

  // 定义输入控制
  TextEditingController usernameController =
      TextEditingController(text: "ducafecat5");
  TextEditingController passwordController =
      TextEditingController(text: "12345678");

  // 表单Key
  final GlobalKey formKey = GlobalKey<FormState>();

  // Sign In
  Future<void> onSignIn() async {
    if ((formKey.currentState as FormState).validate()) {
      try {
        Loading.show();

        var password = EncryptUtil().aesEncode(passwordController.text);
        // API请求
        UserTokenModel res = await UserApi.login(UserLoginReq(
          username: usernameController.text,
          password: password,
        ));

        // 本地保存token
        await UserService.to.setToken(res.token!);

        // 获取用户资料
        await UserService.to.getProfile();

        Loading.success();
        Get.back(result: true);
      } finally {
        Loading.dismiss();
      }
    }
  }

  void onSignUp() {
    Get.offNamed(RouteNames.systemRegister);
  }

  _initData() {
    update(["login"]);
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

  // 释放
  @override
  void onClose() {
    super.onClose();
    usernameController.dispose();
    passwordController.dispose();
  }
}
