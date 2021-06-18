import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/utils/utils.dart';
import 'package:hide_seek_cat_flutter2/global.dart';
import 'package:hide_seek_cat_flutter2/pages/application/application.dart';
import 'package:hide_seek_cat_flutter2/pages/sign/sign.dart';
import 'package:hide_seek_cat_flutter2/pages/welcome/welcome.dart';
import 'package:permission_handler/permission_handler.dart';

/**
 * APP入口管理页
 * @author yinlei
 */
class IndexScreen extends StatefulWidget {
  const IndexScreen({Key? key}) : super(key: key);

  @override
  _IndexScreenState createState() => _IndexScreenState();
}

class _IndexScreenState extends State<IndexScreen> {

  @override
  void initState() {
    super.initState();
    if (!kIsWeb) {
      checkAppUpdateAndRequestPermission();
    }
  }

  Future checkAppUpdateAndRequestPermission() async {
    await Future.delayed(Duration(seconds: 3), () async {
      if(AppGlobal.isAndroid && await Permission.storage.isGranted == false) {
        await [Permission.storage].request();
      }
      if(await Permission.storage.isGranted) {
        AppUpdate().run(context);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: AppGlobal.isFirstOpen == true ? WelcomeScreen() : (
          AppGlobal.isOfflineLogin == true ? ApplicationScreen() : ManagerScreen()
      ),
    );
  }
}

