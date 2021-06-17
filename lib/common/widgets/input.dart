import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

/**
 * 封装input组件
 * @author yinlei
*/
Widget AppInput({
  required TextEditingController controller,
  TextInputType keyboardType = TextInputType.text,
  double marginTop = 22,
  bool autofocus = false,
  bool obscureText = false,
  String? labelText,
  String? hintText,
  bool isOutlineInputBorder = true,
  bool isPassword = false,
  Widget? suffixIcon,
  ValueChanged<String>? onChanged,
  int maxLines = 1,
}) {
  return Container(
    margin: EdgeInsets.only(top: marginTop.h),
    child: TextFormField(
      autofocus: autofocus,
      controller: controller,
      keyboardType: keyboardType,
      decoration: InputDecoration(
        labelText: labelText,
        hintText: hintText,
        contentPadding: EdgeInsets.fromLTRB(20, 10, 0, 9),
        border: isOutlineInputBorder ? OutlineInputBorder() : UnderlineInputBorder(),
        suffixIcon: isPassword ? suffixIcon : null,
      ),
      maxLines: maxLines,
      onChanged: onChanged,
      autocorrect: false,
      obscureText: obscureText,
      validator: (v) {
        return v!.trim().isNotEmpty ? null : "请填写$labelText";
      },
    ),
  );
}