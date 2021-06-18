import 'dart:io';

import 'package:device_info_plus/device_info_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:hide_seek_cat_flutter2/common/entity/entity.dart';
import 'package:hide_seek_cat_flutter2/common/utils/utils.dart';
import 'package:hide_seek_cat_flutter2/common/values/values.dart';
import 'package:package_info_plus/package_info_plus.dart';

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

  /// ios?
  static bool isIOS = Platform.isIOS;

  /// android?
  static bool isAndroid = Platform.isAndroid;

  /// app publish channel
  static String channel = "Google";

  /// app package information
  static late PackageInfo packageInfo;

  /// android device information
  static late AndroidDeviceInfo androidDeviceInfo;

  /// android device information
  static late WebBrowserInfo webBrowserInfo;

  /// ios device information
  static late IosDeviceInfo iosDeviceInfo;

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

    /// init AppSocketIo util.
    // AppSocketIo();

    /// read current device's information
    DeviceInfoPlugin deviceInfoPlugin = DeviceInfoPlugin();
    if(!kIsWeb){
      /// change android's statusbar to transparent.
      if(AppGlobal.isAndroid) {
        SystemUiOverlayStyle systemUiOverlayStyle = SystemUiOverlayStyle(
          statusBarColor: Colors.transparent,
        );
        SystemChrome.setSystemUIOverlayStyle(systemUiOverlayStyle);
      }
      
      if(AppGlobal.isIOS) {
        AppGlobal.iosDeviceInfo = await deviceInfoPlugin.iosInfo;
        print('Running on ${AppGlobal.iosDeviceInfo.utsname.machine}');
      } else if(AppGlobal.isAndroid) {
        AppGlobal.androidDeviceInfo = await deviceInfoPlugin.androidInfo;
        print('Running on ${AppGlobal.androidDeviceInfo.model}');
      }
      /// read app package information
      AppGlobal.packageInfo = await PackageInfo.fromPlatform();
    }

    if(kIsWeb) {
      AppGlobal.webBrowserInfo = await deviceInfoPlugin.webBrowserInfo;
      print('Running on ${AppGlobal.webBrowserInfo.userAgent}');
    }

  }

  /// save user and user's profile config.
  static Future<bool> saveProfile() {
    return AppStorage().setJSON(STORAGE_USER_PROFILE_KEY, profile.toJson());
  }

}