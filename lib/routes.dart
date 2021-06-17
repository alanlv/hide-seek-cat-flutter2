
import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/pages/application/application.dart';
import 'package:hide_seek_cat_flutter2/pages/sign/sign.dart';

/**
 * Flutter App Route Manager.
 * @author yinlei
 */
final Map<String, WidgetBuilder> ylRoutes = {
  ManagerScreen.routeName: (context) => ManagerScreen(),
  LoginScreen.routeName: (context) => LoginScreen(),
  RegisterScreen.routeName: (context) => RegisterScreen(),
  ApplicationScreen.routeName: (context) => ApplicationScreen(),
};