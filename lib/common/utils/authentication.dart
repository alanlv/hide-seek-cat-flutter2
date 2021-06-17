import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/utils/utils.dart';
import 'package:hide_seek_cat_flutter2/common/values/values.dart';
import 'package:hide_seek_cat_flutter2/global.dart';
import 'package:hide_seek_cat_flutter2/pages/sign/sign.dart';
/**
 * 授权登录、注销登录
 * @author yinlei
*/
/// 检查是否授权
Future<bool> isAuthenticated() async {
  var profileJSON = AppStorage().getJSON(STORAGE_USER_PROFILE_KEY);
  return profileJSON != null ? true : false;
}

/// 注销登录
Future deleteAuthentication() async {
  await AppStorage().remove(STORAGE_USER_PROFILE_KEY);
  AppGlobal.profile.user = null;
}

/// 注销登录并去登录
Future goLoginPage(BuildContext context) async {
  await deleteAuthentication();
  Navigator.pushNamedAndRemoveUntil(context, LoginScreen.routeName, (route) => false);
}
