import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/entity/entity.dart';
import 'package:hide_seek_cat_flutter2/common/utils/utils.dart';

/**
 * User API Network request.
 */
class UserApi {

  /// 用户登录
  static Future<Profile?> login({required context, required User params}) async {
    var response = await AppHttps().post('/login', context: context, params: params);
    return Profile.fromJson(response['data']);
  }

  /// 用户注册
  static Future<bool> register({required context, required User params}) async {
    var response = await AppHttps().post('/register', context: context, params: params);
    return response['code'] == 0;
  }
}