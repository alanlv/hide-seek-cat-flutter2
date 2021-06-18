import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'dart:math' as math;

import 'package:hide_seek_cat_flutter2/common/entity/entity.dart';
/**
 * AlertDialog
 * @author yinlei
 */
Future appShowConfirmDialog({
  required BuildContext context,
  required VoidCallback onPressed,
  required VoidCallback cancelPressed,
  required App app,
}) async {
  return await showDialog(
    context: context,
    barrierDismissible: false,
    builder: (_) => AlertDialog(
      title: Text('发现新版本${app.latestVersion}',),
      content: SingleChildScrollView(
        child: ListBody(
          children: <Widget>[
            Text(app.latestDescription??'暂无描述'),
            SizedBox(height: 10.h,),
            ClipRRect(
                borderRadius: BorderRadius.circular(12.r),
                child: Image.network(app.banner??"", height: 200.h, fit: BoxFit.cover,)),
            Text('系统：${app.device}'),
            Text('渠道：${app.channel}'),
            Text('CPU架构：${app.architecture}'),
            Text('机型：${app.model}'),
          ],
        ),
      ),
      actions: [
        OutlinedButton(
          child: Text('升级'),
          onPressed: onPressed,
        ),
        TextButton(
          child: Text('忽略'),
          onPressed: cancelPressed,
        ),
      ],
      shape: BeveledRectangleBorder(
        borderRadius: BorderRadius.circular(10.r),
      ),
      elevation: 24.0,
    ),
  );
}