import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/values/values.dart';

/**
 * Responsive Helper
 * @author yinlei
 */
class AppResponsive extends StatelessWidget {

  final Widget mobile;
  final Widget? tablet;
  final Widget? desktop;

  const AppResponsive({Key? key, required this.mobile, this.tablet, this.desktop}) : super(key: key);

  static bool isMobile(BuildContext context) => MediaQuery.of(context).size.width < AppDeviceSizes.mobileWidth;
  static bool isTablet(BuildContext context) => MediaQuery.of(context).size.width >= AppDeviceSizes.mobileWidth && MediaQuery.of(context).size.width < AppDeviceSizes.webWidth;
  static bool isDesktop(BuildContext context) => MediaQuery.of(context).size.width >= AppDeviceSizes.webWidth;


  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (desktop != null && constraints.maxWidth >= AppDeviceSizes.webWidth) {
          return desktop!;
        } else if (tablet != null && constraints.maxWidth > AppDeviceSizes.mobileWidth) {
          return tablet!;
        } else {
          return mobile;
        }
      },
    );
  }
}
