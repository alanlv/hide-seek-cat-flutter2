import 'package:animated_text_kit/animated_text_kit.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:hide_seek_cat_flutter2/common/api/api.dart';
import 'package:hide_seek_cat_flutter2/common/entity/entity.dart';
import 'package:hide_seek_cat_flutter2/common/provider/provider.dart';
import 'package:hide_seek_cat_flutter2/common/utils/utils.dart';
import 'package:hide_seek_cat_flutter2/common/values/values.dart';
import 'package:hide_seek_cat_flutter2/common/widgets/widgets.dart';
import 'package:hide_seek_cat_flutter2/global.dart';
import 'package:hide_seek_cat_flutter2/pages/application/application.dart';
import 'package:hide_seek_cat_flutter2/pages/sign/sign.dart';
import 'package:provider/provider.dart';
import 'package:rive/rive.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
/**
 * 登录页
 * @author yinlei
 */
class LoginScreen extends StatefulWidget {

  static String routeName = '/login_screen';

  const LoginScreen({Key? key}) : super(key: key);

  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {

  /// rive.
  late RiveAnimationController _riveController;
  bool get _isPlaying => _riveController.isActive;


  GlobalKey _formKey = GlobalKey<FormState>();
  var _showPwd = false;
  final TextEditingController _userNameController = TextEditingController();
  final TextEditingController _userPasswordController = TextEditingController();

  late TapGestureRecognizer _tapGotoRegister;

  @override
  void initState() {
    super.initState();
    _riveController = SimpleAnimation('Animation 1');
    _tapGotoRegister = TapGestureRecognizer()
      ..onTap = _handleTapGotoRegister;
  }

  void _handleTogglePlay() =>
      setState(() => _riveController.isActive = !_riveController.isActive);

  void _handleTapGotoRegister() =>
      Navigator.pushNamed(context, RegisterScreen.routeName);

  void _handleLoginEvent() async {
    if((_formKey.currentState as FormState).validate()) {
      User params = User(
        userName: _userNameController.value.text.trim(),
        password: _userPasswordController.value.text.trim(),
      );
      Profile? res = await UserApi.login(context: context, params: params);
      if(res != null){
        AppGlobal.profile.token = res.token;
        Provider.of<UserModel>(context, listen: false).user = params;
        appShowToast(msg: '登陆成功@');
        Navigator.of(context).pushNamedAndRemoveUntil(ApplicationScreen.routeName, (route) => false,);
      }
    }
  }

  Widget _buildLoginHeader(bool isDesktop) {
    return Container(
      child: Column(
        children: [
          SizedBox(
            width: 1.sw,
            height: isDesktop ? 0.5.sh : 0.3.sh,
            child: RiveAnimation.asset(
              'assets/rives/224-424-luke-vs-darth.riv',
              controllers: [_riveController],
              onInit: () => setState(() {}),
              fit: BoxFit.cover,
            ),
          ),
          Padding(
            padding: EdgeInsets.all(10.r),
            child: FractionallySizedBox(
              widthFactor: 1.0,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  AnimatedTextKit(
                    animatedTexts: [
                      ColorizeAnimatedText(
                        '登录',
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
                  Text(
                    '专属您的账号登入,就可以拍摄分享您的生活短视频，用短视频记录生活的点点滴滴。采用大数据推荐系统和AI，快速匹配共同话题的小伙伴。你还怕奋斗的道路上形单影只？在这里可以快速找到志同道合的朋友，本产品为您的幸福与快乐持续助力！',
                    style: Theme.of(context).textTheme.bodyText2?.copyWith(
                      letterSpacing: 1.2,
                      height: 1.6,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildLoginInput(bool isDesktop) {
    return FractionallySizedBox(
      widthFactor: isDesktop ? 0.5 : 1.0,
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Form(
          key: _formKey,
          autovalidateMode: AutovalidateMode.onUserInteraction,
            child: Column(
            children: [
              AppInput(
                controller: _userNameController,
                labelText: '用户名',
                hintText: 'Account',
                marginTop: 0,
              ),
              AppInput(
                controller: _userPasswordController,
                labelText: '密码',
                hintText: 'Password',
                isPassword: true,
                obscureText: !_showPwd,
                suffixIcon: IconButton(
                  icon: Icon(!_showPwd ? Icons.visibility_off : Icons.visibility),
                  onPressed: (){
                    setState(() {
                      _showPwd = !_showPwd;
                    });
                  },
                ),
              ),
              SizedBox(
                height: 10.h,
              ),
              FractionallySizedBox(
                widthFactor: 1.0,
                child: RichText(
                  textAlign: TextAlign.end,
                 text: TextSpan(
                   text: '还没领取您的专属账号？',
                   style: Theme.of(context).textTheme.bodyText2,
                   children: <TextSpan>[
                     TextSpan(
                         text: '注册',
                         recognizer: _tapGotoRegister,
                         style: TextStyle(fontWeight: FontWeight.bold, decoration: TextDecoration.underline,)),
                     TextSpan(text: '在这里哦~'),
                   ],
                 ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildlLoginBtn(bool isDesktop) {
    return FractionallySizedBox(
      widthFactor: isDesktop ? 0.5 : 1.0,
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: AppSocialButton(
          onPressed: _handleLoginEvent,
          content: Text('登录'),
          img: AssetImage('assets/images/cat.png'),
        ),
      ),
    );
  }

  Widget _buildSocialLoginBtn(bool isDesktop) {
    return FractionallySizedBox(
      widthFactor: isDesktop ? 0.5 : 1.0,
      child: Padding(
        padding: EdgeInsets.all(10.r),
        child: Column(
          children: [
            Row(
                children: <Widget>[
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(right: 10.w),
                        child: Divider(height: 40,),
                      )
                  ),
                  Text("or"),
                  Expanded(
                      child: Padding(
                        padding: EdgeInsets.only(left: 10.w),
                        child: Divider(height: 40,),
                      )
                  ),
                ]
            ),
            AppSocialButton(
              onPressed: () {

              },
              content: Text('使用Github账号登录'),
              img: AssetImage('assets/images/github.png'),
            ),
            SizedBox(
              height: 10.h,
            ),
            AppSocialButton(
              onPressed: () {

              },
              content: Text('使用Google账号登录'),
              img: AssetImage('assets/images/google.png',),
            ),
          ],
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: LayoutBuilder(
        builder: (BuildContext context, BoxConstraints constraints) {
          var isDesktop = constraints.maxWidth > AppDeviceSizes.mobileWidth;
          return Scrollbar(
            child: SingleChildScrollView(
              child: Column(
                children: [
                  _buildLoginHeader(isDesktop),
                  Wrap(
                    children: [
                      _buildLoginInput(isDesktop),
                      _buildSocialLoginBtn(isDesktop),
                    ],
                  ),
                  _buildlLoginBtn(isDesktop),
                ],
              ),
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _handleTogglePlay,
        tooltip: _isPlaying ? 'Pause' : 'Play',
        child: Icon(
          _isPlaying ? Icons.pause : Icons.play_arrow,
        ),
      ),
    );
  }

  @override
  void dispose() {
    _riveController.dispose();
    _userNameController.dispose();
    _userPasswordController.dispose();
    _tapGotoRegister.dispose();
    super.dispose();
  }

}
