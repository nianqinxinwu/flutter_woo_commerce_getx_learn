import 'package:flutter_woo_commerce_getx_learn/common/index.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/request/user_login_req.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/user_token_model.dart';
import 'package:flutter_woo_commerce_getx_learn/common/models/woo/user_profile_model/user_profile_model.dart';

/// 用户 api
class UserApi {
  /// 注册
  static Future<bool> register(UserRegisterReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/register',
      data: req,
    );

    if (res.statusCode == 201) {
      return true;
    }
    return false;
  }

  /// 登录
  static Future<UserTokenModel> login(UserLoginReq? req) async {
    var res = await WPHttpService.to.post(
      '/users/login',
      data: req,
    );
    return UserTokenModel.fromJson(res.data);
  }

  /// Profile
  static Future<UserProfileModel> profile() async {
    var res = await WPHttpService.to.get('/users/me');

    return UserProfileModel.fromJson(res.data);
  }

  /// 保存用户 billing address

  /// 保存用户 shipping address

  /// 大陆国家洲省列表

  /// 保存用户 first name 、 last name 、 email
}
