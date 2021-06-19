import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:hide_seek_cat_flutter2/common/values/values.dart';
import 'package:hide_seek_cat_flutter2/common/widgets/widgets.dart';
import 'package:hide_seek_cat_flutter2/pages/sign/sign.dart';
/**
 * 登陆页与注册页的统一入口页
 * @author yinlei
 */
class ManagerScreen extends StatelessWidget {

  static String routeName = '/manager_screen';

  const ManagerScreen({Key? key}) : super(key: key);

  Widget _buildPageHeader(BuildContext context) {
    return Container(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Row(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              AnimatedTextKit(
                animatedTexts: [
                  ColorizeAnimatedText(
                    '躲猫猫',
                    speed: Duration(milliseconds: 1500),
                    textStyle: Theme.of(context).textTheme.headline6!.copyWith(
                      letterSpacing: 1.5,
                      height: 1.5,
                      fontWeight: FontWeight.bold,
                    ),
                    colors: [
                      Colors.black87,
                      Colors.black54,
                      Colors.black38,
                      Colors.white10,
                    ],
                  ),
                ],
                isRepeatingAnimation: true,
                totalRepeatCount: 5,
                onTap: () {
                },
              ),
              SizedBox(width: 2.w,),
              OutlinedButton(
                onPressed: (){},
                style: OutlinedButton.styleFrom(
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12.r),
                  ),
                ),
                child: Text('beta'),
              ),
            ],
          ),
          SizedBox(
            height: 5.h,
          ),
          Text('一个专为年轻人开发的短视频社交平台，打造年轻人的社交元宇宙。'),
        ],
      ),
    );
  }

  Widget _buildPageContent(BuildContext context) {
    return Container(
      height: 0.4.sh,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage(
            MediaQuery.of(context).platformBrightness == Brightness.light
                ? 'assets/images/cat.png'
                : 'assets/images/cat_dark.png',
          ),
        ),
      ),
    );
  }

  Widget _buildPageChooseBtn(BuildContext context) {
    return Container(
      child: FractionallySizedBox(
        widthFactor: 1.0,
        child: Wrap(
          alignment: WrapAlignment.spaceEvenly,
          runSpacing: 10,
          children: [
            FractionallySizedBox(
              widthFactor: !AppResponsive.isMobile(context) ? 0.3 : 1.0,
              child: AppSocialButton(
                onPressed: () => Navigator.pushNamed(context, LoginScreen.routeName),
                content: Text('已有账号，去登录'),
                img: AssetImage('assets/images/cat.png'),
              ),
            ),
            FractionallySizedBox(
              widthFactor: !AppResponsive.isMobile(context) ? 0.3 : 1.0,
              child: AppSocialButton(
                onPressed: () => Navigator.pushNamed(context, RegisterScreen.routeName),
                content: Text('未拥有账号，去注册'),
                img: AssetImage('assets/images/cat_dark.png'),
              ),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 10.w),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildPageHeader(context),
                _buildPageContent(context),
                _buildPageChooseBtn(context),
              ],
            ),
          ),
        ),
      ),
    );
  }
}