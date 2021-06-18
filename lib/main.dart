import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hide_seek_cat_flutter2/common/provider/provider.dart';
import 'package:hide_seek_cat_flutter2/global.dart';
import 'package:hide_seek_cat_flutter2/pages/index/index.dart';
import 'package:hide_seek_cat_flutter2/routes.dart';
import 'package:hide_seek_cat_flutter2/theme.dart';
import 'package:provider/provider.dart';
import 'package:sentry_flutter/sentry_flutter.dart';

/**
 * 躲猫猫短视频社交APP
 * by flutter2
 * @author yinlei
 * @date 2021/6/15
 */

bool get isInDebugMode {
  // return false;
  return true;
}
/**
 * 错误收集：
 * 1. Dart错误
 * 2. Flutter widget builder错误
 * 3. android ios原生错误
 */
Future<void> main() async {
  FlutterError.onError = (FlutterErrorDetails details) async {
    if(isInDebugMode) {
      FlutterError.dumpErrorToConsole(details);
    } else {// debug mode: handle flutter error and report runZonedGuarded.
      Zone.current.handleUncaughtError(details.exception, details.stack!);
    }
  };

  runZonedGuarded(() async {
    await SentryFlutter.init(
        (options) {
          options.dsn = 'https://c7d2c9d56d704f23b59a6d560e3dfeb0@o496762.ingest.sentry.io/5822562';
        },
    );
    await AppGlobal.init();
    runApp(
      MultiProvider(
        providers: [
          ChangeNotifierProvider(
            create: (_) => UserModel(),
          ),
        ],
        child: MyApp(),
      ),
    );
  }, (exception, stackTrace) async {
    if(isInDebugMode) {
      print(stackTrace);
    } else {
      await Sentry.captureException(exception, stackTrace: stackTrace);
      print('Uploaded error to sentry.io');
    }
  });
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: '躲猫猫',
        debugShowCheckedModeBanner: false,
        navigatorObservers: [/// tracking navigation events
          SentryNavigatorObserver(),
        ],
        themeMode: ThemeMode.system,
        theme: ylLightThemeData(context),
        darkTheme: ylDarkThemeData(context),
        routes: ylRoutes,
        home: IndexScreen(),
      ),
    );
  }
}
