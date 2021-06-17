import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/utils/utils.dart';
import 'package:hide_seek_cat_flutter2/global.dart';

class ApplicationScreen extends StatefulWidget {

  static String routeName = '/application_screen';

  const ApplicationScreen({Key? key}) : super(key: key);

  @override
  _ApplicationScreenState createState() => _ApplicationScreenState();
}

class _ApplicationScreenState extends State<ApplicationScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          children: [
            Text(AppGlobal.profile.token!),
            Text(AppGlobal.profile.user?.userName??'不存在用户'),
            IconButton(
              icon: Icon(Icons.close),
              onPressed: () => goLoginPage(context),
            ),
          ],
        ),
      ),
    );
  }
}
