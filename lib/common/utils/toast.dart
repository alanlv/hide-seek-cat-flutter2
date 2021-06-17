import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

/**
 * toast
 * @author yinlei
 */
void appShowToast({
  required String msg,
  ToastGravity? gravity,
  Color? backgroundColor,
  Color? textColor,
}){
  Fluttertoast.showToast(
      msg: msg,
      toastLength: Toast.LENGTH_SHORT,
      gravity: gravity ?? ToastGravity.CENTER,
      timeInSecForIosWeb: 1,
      backgroundColor: backgroundColor ?? Colors.grey,
      textColor: textColor ?? Colors.white,
  );
}