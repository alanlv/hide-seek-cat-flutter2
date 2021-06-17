import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/entity/entity.dart';
import 'package:hide_seek_cat_flutter2/common/utils/utils.dart';
import 'package:hide_seek_cat_flutter2/common/values/values.dart';

/**
 * APP全局数据管理
 * @author yinlei
 */
class AppGlobal {

  /// user profile
  static Profile profile = Profile();

  /// first time to open ?
  static bool isFirstOpen = false;

  /// offlineLogin?
  static bool isOfflineLogin = false;

  static Future init() async {
    /// tell flutter framework wait AppGlobal then render.
    WidgetsFlutterBinding.ensureInitialized();

    /// init storage util.
    await AppStorage.init();

    /// init AppHttps util.
    AppHttps();

    /// device is first time opened?
    isFirstOpen = !AppStorage().getBool(STORAGE_DEVICE_ALREADY_OPEN_KEY);
    if(isFirstOpen) {
      AppStorage().setBool(STORAGE_DEVICE_ALREADY_OPEN_KEY, true);
    }

    /// read offline profile.
    var _profileJSON = AppStorage().getJSON(STORAGE_USER_PROFILE_KEY);
    if(_profileJSON != null) {
      profile = Profile.fromJson(_profileJSON);
      isOfflineLogin = true;
    }

  }

  /// save user and user's profile config.
  static Future<bool> saveProfile() {
    return AppStorage().setJSON(STORAGE_USER_PROFILE_KEY, profile.toJson());
  }

}