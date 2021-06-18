import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/entity/entity.dart';
import 'package:hide_seek_cat_flutter2/common/utils/utils.dart';

/**
 * App Api Network request.
 * @author yinlei
 */
class AppApi {

  /// App升级
  static Future<App> appUpdate({required context, required App params}) async {
    var response = await AppHttps().post('/app/update', context: context, params: params);
    return App.fromJson(response);
  }



}