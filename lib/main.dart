import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hide_seek_cat_flutter2/global.dart';
import 'package:hide_seek_cat_flutter2/pages/index/index.dart';
import 'package:hide_seek_cat_flutter2/routes.dart';
import 'package:hide_seek_cat_flutter2/theme.dart';

/**
 * 躲猫猫短视频社交APP
 * by flutter2
 * @author yinlei
 * @date 2021/6/15
 */
void main() => AppGlobal.init().then((e) => runApp(MyApp()));


class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      designSize: Size(360, 690),
      builder: () => MaterialApp(
        title: '躲猫猫',
        debugShowCheckedModeBanner: false,
        themeMode: ThemeMode.system,
        theme: ylLightThemeData(context),
        darkTheme: ylDarkThemeData(context),
        routes: ylRoutes,
        home: IndexScreen(),
      ),
    );
  }
}
