import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 社交账号登陆按钮
 * @author yinlei
 */
Widget AppSocialButton({
  required VoidCallback? onPressed,
  required Widget content,
  required ImageProvider img,
}) {
  return OutlinedButton(
    onPressed: onPressed,
    style: OutlinedButton.styleFrom(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(50.r),
      ),
      padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
    ),
    child: Stack(
      alignment: Alignment.center,
      children: [
        Align(
            alignment: Alignment.center,
            child: content
        ),
        Align(
          alignment: Alignment.centerLeft,
          child: CircleAvatar(
            foregroundImage: img,
            radius: 12.r,
            backgroundColor: Colors.transparent,
          ),
        ),
      ],
    ),
  );
}