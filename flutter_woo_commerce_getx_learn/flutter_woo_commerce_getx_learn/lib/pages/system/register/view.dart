import 'package:flutter/material.dart';
import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:get/get.dart';

import 'index.dart';

class RegisterPage extends GetView<RegisterController> {
  const RegisterPage({super.key});

  // 底部 按钮
  Widget _buildBtnSignUp() {
    return ButtonWidget.primary(
      LocaleKeys.loginSignUp.tr,
      onTap: controller.onSignUp,
    ).paddingBottom(AppSpace.listRow);
  }

  // 底部按钮上方 提示
  Widget _buildTips() {
    return <Widget>[
      // 提示
      TextWidget.body2(LocaleKeys.registerHaveAccount.tr),
      // 登录文字按钮
      ButtonWidget.text(
        LocaleKeys.loginSignIn.tr,
        onTap: controller.onSignIn,
        textSize: 12,
        textColor: AppColors.primary,
      )
    ].toRow(
      mainAxisAlignment: MainAxisAlignment.center,
    );
  }

  // 表单页
  Widget _buildForm() {
    return Form(
      autovalidateMode: AutovalidateMode.onUserInteraction,
      child: <Widget>[
        // 用户名
        TextFormWidget(
          autofocus: true,
          controller: controller.userNameController,
          labelText: LocaleKeys.registerFormName.tr,
        ),

        // 邮箱
        TextFormWidget(
          autofocus: true,
          controller: controller.emailController,
          labelText: LocaleKeys.registerFormEmail.tr,
          keyboardType: TextInputType.emailAddress,
        ),
        // 姓
        TextFormWidget(
          autofocus: true,
          controller: controller.firstNameController,
          labelText: LocaleKeys.registerFormFirstName.tr,
        ),

        // 名
        TextFormWidget(
          autofocus: true,
          controller: controller.lastNameController,
          labelText: LocaleKeys.registerFormLastName.tr,
        ),

        // 密码
        TextFormWidget(
          controller: controller.passwordController,
          labelText: LocaleKeys.registerFormPassword.tr,
          isObscure: true,
        ),

        // 注册按钮
        _buildBtnSignUp(),

        // 底部提示
        _buildTips(),

      ].toColumn(),
    );
  }


  // 主视图
  Widget _buildView() {
    return SingleChildScrollView(
      child: <Widget>[
        // 顶部表头
        PageTitleWidget(
          title: LocaleKeys.registerTitle.tr,
          desc: LocaleKeys.registerDesc.tr,
        ),

        // 表单页
        _buildForm(),
      ].toColumn(
        crossAxisAlignment: CrossAxisAlignment.start
      )
      .paddingHorizontal(AppSpace.page),
    );
  }

  @override
  Widget build(BuildContext context) {
    return GetBuilder<RegisterController>(
      init: RegisterController(),
      id: "register",
      builder: (_) {
        return Scaffold(
          appBar: AppBar(title: Text(LocaleKeys.loginSignUp.tr)),
          body: SafeArea(
            child: _buildView(),
          ),
        );
      },
    );
  }
}
