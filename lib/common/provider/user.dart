
/**
 * Provider状态管理
 * https://pub.dev/packages/provider
 * @author yinlei
 */

import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/entity/entity.dart';
import 'package:hide_seek_cat_flutter2/global.dart';

/// APP用户配置信息状态管理 (基类，其他provider需要依赖它)
class ProfileProvider extends ChangeNotifier {

  Profile get _profile => AppGlobal.profile;

  @override
  void notifyListeners() {
    /// 通知其下面的树更新之前先保存用户配置信息
    AppGlobal.saveProfile();
    super.notifyListeners();
  }

}

class UserModel extends ProfileProvider {

  User? get user => _profile.user;

  /// app是否登录
  bool get isLogin => user != null;

  set user(User? user) {
    _profile.user = user;
    notifyListeners();
  }

}


