import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/global.dart';
import 'package:hide_seek_cat_flutter2/pages/application/application.dart';
import 'package:hide_seek_cat_flutter2/pages/sign/sign.dart';
import 'package:hide_seek_cat_flutter2/pages/welcome/welcome.dart';

/**
 * APP入口管理页
 * @author yinlei
 */
class IndexScreen extends StatelessWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGlobal.isFirstOpen == true ? WelcomeScreen() : (
          AppGlobal.isOfflineLogin == true ? ApplicationScreen() : ManagerScreen()
      ),
    );
  }
}