import 'package:flutter/material.dart';

/**
 * 登陆页与注册页的统一入口页
 * @author yinlei
 */
class ManagerScreen extends StatelessWidget {

  static String routeName = '/manager_screen';

  const ManagerScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text('登陆注册'),
      ),
    );
  }
}
